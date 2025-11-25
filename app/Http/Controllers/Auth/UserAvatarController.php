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
        $storage_path = 'avatars';

        $message = 'Avatar updated successfully';

        $user = User::findOrFail($user_id);

        //remove old avatar
        if ($user->avatar && isset($user->avatar['path']) && file_exists($user->avatar['path'])) {
            unlink($user->avatar['path']);
        }

        if ($request->hasFile('avatar')) {
            $new_file = $request->file('avatar')->store($storage_path, 'public');
            //TODO::resize image

            $user->avatar = basename($new_file);
        }else{
            //if just remove the avatar
            $user->avatar = null;
            $message = 'Avatar removed successfully';
        }

        $user->save();

        return response()->json(['message' => $message]);
    }
}
