<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserAvatarController extends Controller
{
    public function __invoke(Request $request)
    {
        $user_id = auth()->user()->isAdmin() ? $request->user_id : auth()->id();

        $user = User::find($user_id);
        if($user->avatar['path']){
            \Storage::delete($user->avatar['path']);
        }


        $user->update(['avatar' => $request->file('avatar')->store('avatars', 'public')]);

        return back();
    }
}
