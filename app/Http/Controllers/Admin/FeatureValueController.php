<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\FeatureValueFormRequest;
use App\Models\Feature;
use App\Models\FeatureValue;
use App\Transformers\DataTable\FeatureValueDataTable;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class FeatureValueController extends Controller
{
    public function index(Request $request): Response|array|BinaryFileResponse
    {
        if ($request->ajax() && $request->json === 'true') {
            return FeatureValueDataTable::make()->get();
        }

        return Inertia::render('admin/FeatureValue/index', [
            'featureSelect'=>Feature::forSelect()
        ]);
    }

    public function create(): Response
    {
        return Inertia::render('admin/FeatureValue/form', [
            'featureSelect'=>Feature::forSelect()
        ]);
    }

    public function store(FeatureValueFormRequest $request)
    {
        $data = $request->validated();
        featureValue::query()->create($data);

        return redirect(route('feature-value.index'));
    }

    public function update(featureValue $featureValue, FeatureValueFormRequest $request)
    {
        $data = $request->validated();
        $featureValue->update($data);

        return redirect(route('feature-value.index'));
    }

    public function edit(featureValue $featureValue): Response
    {
        return Inertia::render('admin/FeatureValue/form', [
            'model' => $featureValue,
            'featureSelect'=>Feature::forSelect()
        ]);
    }

    public function destroy($id)
    {
        featureValue::destroy([$id]);
        return back();
    }
}
