<?php

namespace App\Http\Controllers;

use App\Mail\Contact;
use App\Models\Post;
use App\Models\Voice;
use App\Transformers\DataTable\VoicesSiteDataTable;
use Illuminate\Support\Facades\Mail;
use Inertia\Inertia;

class MainController extends Controller
{
    /**
     * @throws \Exception
     */
    public function index(){

        $voices['data'] = Voice::query()->withFeatureValues([])->with(['featureValues.feature','user','samples'])
            ->take(6)->get()->map(fn($item)=>VoicesSiteDataTable::itemTransform($item));


        $posts=Post::query()->where('posts.section','like','home.%')
            ->orderBy('posts.position')
            ->get();


        [$features, $contents] = $posts->partition(function ($post) {
            return $post->section === 'home.features';
        });

        $contents = $contents->keyBy('section');

        return Inertia::render('Home',[
            'voices' => $voices,
            'features' => $features->values(),
            'contents' => $contents,
        ]);
    }

    public function about(){
        $about = Post::query()->where('section','about')->first();
        return Inertia::render('About',[
            'about' => $about,
        ]);
    }
    public function contacts(){
        return Inertia::render('Contacts');
    }

    public function send():\Illuminate\Http\RedirectResponse
    {
        \request()->validate([
            'name' => 'required',
            'email' => 'required|email',
            'message' => 'required|min:5',
        ]);

        //defer(function ()  {
            $mail = new Contact(request()->get('message'), request()->get('email'), request()->get('name'));
            Mail::to(config('mail.admin_email'))->send($mail);
       // });

        return redirect('contacts')->with('message', 'success');
    }
}
