<?php

namespace App\Http\Controllers;

use App\Models\Favorite;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;


class FavoriteToggleController extends Controller
{
    public function __invoke(Request $request):JsonResponse
    {
        $request->validate(['voice_id' => 'required|integer']);

        $voice_id = $request->voice_id;
        $user_id = auth()->id();

        $favorite = Favorite::query()->where('voice_id', $voice_id)->where('user_id', $user_id)->first();
        $isFavorite = false;

        if($favorite){
            $favorite->delete();
        }else{
            Favorite::query()->create(['voice_id' => $voice_id, 'user_id' => $user_id]);
            $isFavorite = true;
        }

        return response()->json(['isFavorite' => $isFavorite]);
    }
}
