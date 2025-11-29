<?php

namespace App\Http\Controllers\Profile;

use App\Http\Controllers\Controller;
use App\Http\Requests\OrderFormRequest;
use App\Http\Resources\UserOrderResource;
use App\Models\User;
use App\Services\OrderCalculator;
use Illuminate\Http\RedirectResponse;
use Illuminate\Support\Facades\DB;
use Inertia\Inertia;

class OrdersController extends Controller
{
    /**
     * @throws \Throwable
     */
    public function index()
    {

        $orders = auth()->user()->orders()->with(['voices','reviews'])
            ->latest()->get();

        $orders = UserOrderResource::collection($orders);


        return Inertia::render('Profile/Orders',[
            'orders' => $orders
        ]);
    }


    public function create()
    {

        $cart_voices = explode(',',\request('cart_voices'));

        $artists=collect();
        if(count($cart_voices) > 0) {
            $artists = User::withWhereHas('voices', function ($query) use ($cart_voices) {
                $query->with('samples')->whereIn('id', $cart_voices);
            })->get()->map(function ($user) {
                return [
                    'id' => $user->id,
                    'name'=>$user->name,
                    'user_initials'=>$user->initials,
                    'voices'=>$user->voices->map(function($voice){
                        return [
                            'id'=>$voice->id,
                            'sample'=>$voice->featuredSample(),
                            'title'=>$voice->title
                        ];
                    })
                ];
            });
        }

        return Inertia::render('Orders/Create',[
            'artists' => $artists,
            'order_calculator_translations'=>OrderCalculator::getTranslations()
        ]);
    }

    public function show($id)
    {
        return Inertia::render('Profile/Order',[
            'order' => auth()->user()->orders()->with(['voices'=>function ($query) {
                $query->with('samples','user');
            },'reviews'])->findOrFail($id)
        ]);
    }


    /**
     * @throws \Throwable
     */
    public function store(OrderFormRequest $request):RedirectResponse
    {

        $data = $request->validated();
        $voices=$data['voices'];
        unset($data['voices']);

        return DB::transaction(function () use ($data, $voices) {
            $order = auth()->user()->orders()->create($data);

            $attachData = collect($voices)->mapWithKeys(function ($voice) {
                return [$voice['voice_id'] => ['artist_notes' => $voice['artist_notes']]];
            })->all();

            $order->voices()->attach($attachData);

            return redirect()->route('orders.index')
                ->with(['modal'=>['title'=>__('site.order_sent_title'),'description'=>__('site.order_sent_message')],'clear_cart'=>true]);
        });


    }
}
