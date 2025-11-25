<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\UserFormRequest;
use App\Models\User;
use App\Transformers\DataTable\UserDataTable;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class UserController extends Controller
{
    public function index(Request $request): Response|array|BinaryFileResponse
    {
        if ($request->ajax() && $request->json === 'true') {
            return UserDataTable::make()->get();
        }

        return Inertia::render('admin/User/index', []);
    }

    public function show(User $user): Response
    {
        return Inertia::render('admin/User/show', [
            'user' => $user,
        ]);
    }

    public function create(): Response
    {
        return Inertia::render('admin/User/form', []);
    }

    public function store(UserFormRequest $request)
    {
        $data = $request->validated();
        user::query()->create($data);

        return redirect(route('user.index'));
    }

    public function update(user $user, UserFormRequest $request)
    {
        $data = $request->validated();
        $user->update($data);

        return redirect(route('user.index'));
    }

    public function edit(user $user): Response
    {
        return Inertia::render('admin/User/form', [
            'model' => $user,
        ]);
    }

    public function destroy($id)
    {
        user::destroy([$id]);
        return back();
    }
}
