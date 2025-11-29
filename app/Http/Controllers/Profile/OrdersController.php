<?php

declare(strict_types=1);

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

        $orders = auth()->user()->orders()->with(['voices', 'reviews'])
            ->latest()->get();

        $orders = UserOrderResource::collection($orders);

        return Inertia::render('Profile/Orders', [
            'orders' => $orders,
        ]);
    }

    public function create()
    {

        $cart_voices = explode(',', \request('cart_voices'));

        $artists = collect();
        if ($cart_voices !== []) {
            $artists = User::withWhereHas('voices', function ($query) use ($cart_voices): void {
                $query->with('samples')->whereIn('id', $cart_voices);
            })->get()->map(function ($user): array {
                return [
                    'id' => $user->id,
                    'name' => $user->name,
                    'avatar' => $user->avatar,
                    'voices' => $user->voices->map(function ($voice): array {
                        return [
                            'id' => $voice->id,
                            'sample' => $voice->featuredSample(),
                            'title' => $voice->title,
                        ];
                    }),
                ];
            });
        }

        return Inertia::render('Orders/Create', [
            'artists' => $artists,
            'order_calculator_translations' => OrderCalculator::getTranslations(),
        ]);
    }

    public function show($id)
    {
        return Inertia::render('Profile/Order', [
            'order' => auth()->user()->orders()->with(['voices' => function ($query): void {
                $query->with('samples', 'user');
            }, 'reviews'])->findOrFail($id),
        ]);
    }

    /**
     * @throws \Throwable
     */
    public function store(OrderFormRequest $orderFormRequest): RedirectResponse
    {

        $data = $orderFormRequest->validated();
        $voices = $data['voices'];
        unset($data['voices']);

        return DB::transaction(function () use ($data, $voices) {
            $order = auth()->user()->orders()->create($data);

            $attachData = collect($voices)->mapWithKeys(function (array $voice): array {
                return [$voice['voice_id'] => ['artist_notes' => $voice['artist_notes']]];
            })->all();

            $order->voices()->attach($attachData);

            return redirect()->route('orders.index')
                ->with(['modal' => ['title' => __('site.order_sent_title'), 'description' => __('site.order_sent_message')], 'clear_cart' => true]);
        });

    }
}
