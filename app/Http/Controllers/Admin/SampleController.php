<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\SampleFormRequest;
use App\Models\Sample;
use App\Transformers\DataTable\SampleDataTable;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class SampleController extends Controller
{
    public function index(Request $request): Response|array|BinaryFileResponse
    {
        if ($request->ajax() && $request->json === 'true') {
            return SampleDataTable::make()->get();
        }

        return Inertia::render('admin/Sample/index', []);
    }

    public function create(): Response
    {
        return Inertia::render('admin/Sample/form', []);
    }

    public function store(SampleFormRequest $request)
    {
        $data = $request->validated();
        sample::query()->create($data);

        return redirect(route('sample.index'));
    }

    public function update(sample $sample, SampleFormRequest $request)
    {
        $data = $request->validated();
        $sample->update($data);

        return redirect(route('sample.index'));
    }

    public function edit(sample $sample): Response
    {
        return Inertia::render('admin/Sample/form', [
            'model' => $sample,
        ]);
    }

    public function destroy($id)
    {
        sample::destroy([$id]);
        return back();
    }
}
