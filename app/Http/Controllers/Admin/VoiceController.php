<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\VoiceFormRequest;
use App\Models\Feature;
use App\Models\User;
use App\Models\Voice;
use App\Transformers\DataTable\VoiceDataTable;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Spatie\RouteAttributes\Attributes\Post;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class VoiceController extends Controller
{
    /**
     * @throws \Exception
     */
    public function index(Request $request): Response|array|BinaryFileResponse
    {
        if ($request->ajax() && $request->json === 'true') {
            return VoiceDataTable::make()->get();
        }

        return Inertia::render('admin/Voice/index', []);
    }

    public function create(): Response
    {
        return Inertia::render('admin/Voice/form', [
            'users'=>User::forSelectArtists()
        ]);
    }

    public function show(Voice $voice): Response
    {
        $voice->load('featureValues.feature','user', 'samples');

        $voice->featureValues->sortByDesc(function ($featureValue) {
            return $featureValue->feature->name;
        });

        return Inertia::render('admin/Voice/show', [
            'voice'=>$voice,
            'featuresSelect'=>Feature::forSelect(),
        ]);
    }

    public function store(VoiceFormRequest $request)
    {
        $data = $request->validated();
        voice::query()->create($data);

        return redirect(route('voice.index'));
    }

    public function update(Voice $voice, VoiceFormRequest $request)
    {
        $data = $request->validated();
        $voice->update($data);

        return redirect(route('voice.index'));
    }

    public function edit(voice $voice): Response
    {
        return Inertia::render('admin/Voice/form', [
            'model' => $voice,
            'users'=>User::forSelectArtists()
        ]);
    }

    public function destroy($id)
    {
        voice::destroy([$id]);
        return back();
    }

    #[Post('admin/voice/{id}/toggle-status')]
    public function toggleStatus($id):string
    {
        $voice = Voice::query()->findOrFail($id);
        $voice->is_active = !$voice->is_active;
        $voice->save();

        return 'success';
    }
}
