<?php

declare(strict_types=1);

namespace App\Http\Controllers\Profile;

use App\Http\Controllers\Controller;
use App\Http\Requests\ReviewFormRequest;
use App\Models\Review;
use Inertia\Inertia;

class ReviewsController extends Controller
{
    public function index()
    {
        return Inertia::render('Profile/Reviews');
    }

    public function store(ReviewFormRequest $reviewFormRequest): \Illuminate\Http\RedirectResponse
    {
        $data = $reviewFormRequest->validated();
        $data['user_id'] = auth()->id();

        Review::query()->create($data);

        return back();
    }

    public function update(ReviewFormRequest $reviewFormRequest, Review $review): \Illuminate\Http\RedirectResponse
    {
        $data = $reviewFormRequest->validated();
        $data['user_id'] = auth()->id();
        $review->update($data);

        return back();
    }
}
