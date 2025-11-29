<?php

declare(strict_types=1);

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\ReviewFormRequest;
use App\Lote\Traits\HasReturnUrl;
use App\Models\Review;
use App\Transformers\DataTable\ReviewDataTable;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class ReviewController extends Controller
{
    use HasReturnUrl;

    public function index(Request $request): Response|array|BinaryFileResponse
    {
        if ($request->ajax() && $request->json === 'true') {
            return ReviewDataTable::make()->get();
        }

        return Inertia::render('admin/Review/index', []);
    }

    public function create(): Response
    {
        return Inertia::render('admin/Review/form', []);
    }

    public function store(ReviewFormRequest $reviewFormRequest): \Illuminate\Http\RedirectResponse
    {
        $data = $reviewFormRequest->validated();
        review::query()->create($data);

        return $this->redirectAfterSave($reviewFormRequest, to_route('review.index'));
    }

    public function update(review $review, ReviewFormRequest $reviewFormRequest): \Illuminate\Http\RedirectResponse
    {
        $data = $reviewFormRequest->validated();
        $review->update($data);

        return $this->redirectAfterSave($reviewFormRequest, to_route('review.index'));
    }

    public function edit(review $review): Response
    {
        return Inertia::render('admin/Review/form', [
            'model' => $review,
        ]);
    }

    public function destroy($id): \Illuminate\Http\RedirectResponse
    {
        review::destroy([$id]);

        return back();
    }
}
