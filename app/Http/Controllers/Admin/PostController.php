<?php

declare(strict_types=1);

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\PostFormRequest;
use App\Lote\Traits\HasReturnUrl;
use App\Models\Post;
use App\Transformers\DataTable\PostDataTable;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class PostController extends Controller
{
    use HasReturnUrl;

    public function index(Request $request): Response|array|BinaryFileResponse
    {
        if ($request->ajax() && $request->json === 'true') {
            return PostDataTable::make()->get();
        }

        return Inertia::render('admin/Post/index', []);
    }

    public function create(): Response
    {
        return Inertia::render('admin/Post/form', []);
    }

    public function store(PostFormRequest $postFormRequest): \Illuminate\Http\RedirectResponse
    {
        $data = $postFormRequest->validated();
        Post::query()->create($data);

        return $this->redirectAfterSave($postFormRequest, to_route('post.index'));
    }

    public function update(post $post, PostFormRequest $postFormRequest): \Illuminate\Http\RedirectResponse
    {
        $data = $postFormRequest->validated();
        $post->update($data);

        return $this->redirectAfterSave($postFormRequest, to_route('post.index'));
    }

    public function edit(post $post): Response
    {
        return Inertia::render('admin/Post/form', [
            'model' => $post->toArrayWithTranslations(),
        ]);
    }

    public function destroy($id): \Illuminate\Http\RedirectResponse
    {
        post::destroy([$id]);

        return back();
    }
}
