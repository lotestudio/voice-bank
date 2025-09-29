<?php

namespace App\Http\Controllers;

use App\Models\Voice;
use App\Transformers\DataTable\VoicesSiteDataTable;
use Inertia\Inertia;

class MainController extends Controller
{
    /**
     * @throws \Exception
     */
    public function index(){

        $voices['data'] = Voice::query()->withFeatureValues([])->with(['featureValues.feature','user','samples'])
            ->take(6)->get()->map(fn($item)=>VoicesSiteDataTable::itemTransform($item));

        return Inertia::render('Home',[
            'voices' => $voices
        ]);
    }

    public function about(){
        return Inertia::render('About');
    }
    public function contacts(){
        return Inertia::render('Contacts');
    }
}
