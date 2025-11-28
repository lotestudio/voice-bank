<?php

namespace App\Http\Controllers\Profile;

use App\Http\Controllers\Controller;
use App\Http\Requests\ReviewFormRequest;
use App\Models\Review;
use Illuminate\Http\Request;
use Inertia\Inertia;

class ReviewsController extends Controller
{

    public function index(){
        return Inertia::render('Profile/Reviews');
    }

    public function store(ReviewFormRequest $request)
    {
        $data = $request->validated();
        $data['user_id'] = auth()->id();

        Review::query()->create($data);

        return back();
    }

    public function update(ReviewFormRequest $request, Review $review)
    {
        $data = $request->validated();
        $data['user_id'] = auth()->id();
        $review->update($data);

        return back();
    }
}
