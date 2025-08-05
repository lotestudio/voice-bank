<?php

namespace App\Http\Controllers;


use App\Transformers\DataTable\VoicesSiteDataTable;
use Inertia\Inertia;

class VoicesController extends Controller
{
    /**
     * @throws \Exception
     */
    public function index()
    {
        $voices = VoicesSiteDataTable::make()->getTableData();

        return Inertia::render('Voices',[
            'voices' => $voices
        ]);
    }
}
