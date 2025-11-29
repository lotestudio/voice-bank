<?php

declare(strict_types=1);

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\VoiceFormRequest;
use App\Lote\Traits\HasReturnUrl;
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
    use HasReturnUrl;

    /**
     * @throws \Exception
     */
    public function index(Request $request): Response|array|BinaryFileResponse
    {
        if ($request->ajax() && $request->json === 'true') {
            return VoiceDataTable::make()->get();
        }

        return Inertia::render('admin/Voice/index', [
            'usersSelect' => User::forSelectArtists(),
            'userIdFilter'=>(int) $request->user_id ?? null,
        ]);
    }

    public function create(): Response
    {
        return Inertia::render('admin/Voice/form', [
            'users' => User::forSelectArtists(),
        ]);
    }

    public function show(Voice $voice): Response
    {
        $voice->load('featureValues.feature.values', 'user', 'samples');

        $featureValues = $voice->featureValues->groupBy('feature.display_name')->map(function ($featureValues, $featureName): array {
            return ['selected' => $featureValues->pluck('id')->toArray(), 'forSelect' => $featureValues[0]->feature->values->map(function ($value): array {
                return [
                    'label' => $value->display_value,
                    'value' => $value->id,
                ];
            })->toArray(), 'is_featured' => $featureValues[0]->feature->is_featured, 'id' => $featureValues[0]->feature->id, 'name' => $featureValues[0]->feature->display_name, 'sort_order' => $featureValues[0]->feature->sort_order];
        })->sortBy('sort_order');

        $selected = $featureValues->mapWithKeys(function (array $item, $feature_id): array {
            return [$item['id'] => $item['selected']];
        });

        $disabledFeatureIds = $voice->featureValues->groupBy('feature_id')->keys()->toArray();

        return Inertia::render('admin/Voice/show', [
            'voice' => $voice,
            'featuresSelect' => Feature::forSelect(),
            'featureValues' => $featureValues,
            'disabledFeatureIds' => $disabledFeatureIds,
            'selected' => $selected,
        ]);
    }

    public function store(VoiceFormRequest $voiceFormRequest): \Illuminate\Http\RedirectResponse
    {
        $data = $voiceFormRequest->validated();
        voice::query()->create($data);

        return $this->redirectAfterSave($voiceFormRequest, to_route('voice.index'));
    }

    public function update(Voice $voice, VoiceFormRequest $voiceFormRequest): \Illuminate\Http\RedirectResponse
    {
        $data = $voiceFormRequest->validated();
        $voice->update($data);

        return $this->redirectAfterSave($voiceFormRequest, to_route('voice.index'));
    }

    public function edit(voice $voice): Response
    {
        return Inertia::render('admin/Voice/form', [
            'model' => $voice,
            'users' => User::forSelectArtists(),
        ]);
    }

    public function destroy($id): \Illuminate\Http\RedirectResponse
    {
        voice::destroy([$id]);

        return back();
    }

    #[Post('admin/voice/{id}/toggle-status')]
    public function toggleStatus($id): string
    {
        $voice = Voice::query()->findOrFail($id);
        $voice->is_active = ! $voice->is_active;
        $voice->save();

        return 'success';
    }
}
