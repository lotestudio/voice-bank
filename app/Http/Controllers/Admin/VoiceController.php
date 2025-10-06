<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\VoiceFormRequest;
use App\Models\Feature;
use App\Models\Voice;
use App\Transformers\DataTable\VoiceDataTable;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class VoiceController extends Controller
{
    public function index(Request $request): Response|array|BinaryFileResponse
    {
        if ($request->ajax() && $request->json === 'true') {
            return VoiceDataTable::make()->get();
        }

        return Inertia::render('admin/Voice/index', []);
    }

    public function create(): Response
    {
        return Inertia::render('admin/Voice/form', []);
    }

    public function store(VoiceFormRequest $request)
    {
        $data = $request->validated();
        voice::query()->create($data);

        return redirect(route('voice.index'));
    }

    public function update(voice $voice, VoiceFormRequest $request)
    {
        $data = $request->validated();
        $voice->update($data);

        return redirect(route('voice.index'));
    }

    public function edit(voice $voice): Response
    {
        return Inertia::render('admin/Voice/form', [
            'model' => $voice,
        ]);
    }

    public function destroy($id)
    {
        voice::destroy([$id]);
        return back();
    }
}
