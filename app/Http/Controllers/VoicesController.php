<?php

namespace App\Http\Controllers;


use App\Models\Feature;
use App\Transformers\DataTable\VoicesSiteDataTable;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class VoicesController extends Controller
{
    /**
     * @throws \Exception
     */
    public function index(Request $request): Response|array|BinaryFileResponse
    {
        //$voices = VoicesSiteDataTable::make()->getTableData();

        if ($request->ajax() && $request->json === 'true') {
            return VoicesSiteDataTable::make()->getTableData();
        }

        [$featured_filters,$filters] = Feature::with('values')->get()->map(function ($feature) {
            $feature->valuesForSelect = $feature->valuesForSelect($feature->is_featured);
            return $feature;
        })->partition(function ($feature) {
            return $feature->is_featured;
        });

        return Inertia::render('Voices',[
            'featured_filters' => $featured_filters,
            'filters' => $filters,
        ]);
    }
}
