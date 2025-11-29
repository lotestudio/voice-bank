<?php

namespace App\Http\Controllers\Dev;

use App\Http\Controllers\Controller;
use App\Transformers\DataTable\VoicesSiteDataTable;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class DataListTestController extends Controller
{
    /**
     * @throws \Exception
     */
    public function __invoke(Request $request): Response|array|BinaryFileResponse
    {
        if ($request->ajax() && $request->json === 'true') {
            return VoicesSiteDataTable::make()->getTableData();
        }

        return Inertia::render('dev/DataListTest');
    }
}
