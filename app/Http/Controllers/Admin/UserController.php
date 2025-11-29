<?php

declare(strict_types=1);

namespace App\Http\Controllers\Admin;

use App\Enums\Roles;
use App\Http\Controllers\Controller;
use App\Http\Requests\UserFormRequest;
use App\Lote\Traits\HasReturnUrl;
use App\Models\User;
use App\Transformers\DataTable\UserDataTable;
use Illuminate\Http\Request;
use Inertia\Inertia;
use Inertia\Response;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class UserController extends Controller
{
    use HasReturnUrl;

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
        return Inertia::render('admin/User/form', [
            'rolesSelect' => Roles::forSelect(prepend:true, prependLabel: 'Choose role', toArray: true),
        ]);
    }

    public function store(UserFormRequest $userFormRequest): \Illuminate\Http\RedirectResponse
    {
        $data = $userFormRequest->validated();
        user::query()->create($data);

        return $this->redirectAfterSave($userFormRequest, to_route('user.index'));
    }

    public function update(user $user, UserFormRequest $userFormRequest): \Illuminate\Http\RedirectResponse
    {
        $data = $userFormRequest->validated();
        $user->update($data);

        return $this->redirectAfterSave($userFormRequest, to_route('user.index'));
    }

    public function edit(user $user): Response
    {
        return Inertia::render('admin/User/form', [
            'model' => $user,
            'rolesSelect' => Roles::forSelect(prependLabel: 'Choose role', toArray: true),
        ]);
    }

    public function destroy($id): \Illuminate\Http\RedirectResponse
    {
        user::destroy([$id]);

        return back();
    }
}
