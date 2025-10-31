<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\FeatureFormRequest;
use App\Models\Feature;
use App\Models\Voice;
use App\Transformers\DataTable\FeatureDataTable;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Spatie\RouteAttributes\Attributes\Post;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class FeatureController extends Controller
{
    public function index(Request $request): Response|array|BinaryFileResponse
    {
        if ($request->ajax() && $request->json === 'true') {
            return FeatureDataTable::make()->get();
        }

        return Inertia::render('admin/Feature/index', []);
    }

    public function create(): Response
    {
        return Inertia::render('admin/Feature/form', []);
    }

    public function store(FeatureFormRequest $request)
    {
        $data = $request->validated();
        feature::query()->create($data);

        return redirect(route('feature.index'));
    }

    public function update(feature $feature, FeatureFormRequest $request)
    {
        $data = $request->validated();
        $feature->update($data);

        return redirect(route('feature.index'));
    }

    public function edit(feature $feature): Response
    {
        return Inertia::render('admin/Feature/form', [
            'model' => $feature,
        ]);
    }

    public function destroy($id)
    {
        feature::destroy([$id]);
        return back();
    }


    #[Post('admin/feature/{id}/toggle-featured')]
    public function toggleFeatured($id):string
    {
        $voice = Feature::query()->findOrFail($id);
        $voice->is_featured = !$voice->is_featured;
        $voice->save();

        return 'success';
    }
}
