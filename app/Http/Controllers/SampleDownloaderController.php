<?php

namespace App\Http\Controllers;

use App\Models\Sample;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;

class SampleDownloaderController extends Controller
{

    public function __invoke($id): \Symfony\Component\HttpFoundation\StreamedResponse
    {
        $sample = Sample::with('voice.user')->findOrFail($id);
        $filename = $sample->file_url;

        if (!Storage::disk('public')->exists('samples/'.$filename)) {
            abort(404, 'File not found');
        }

        $extension = pathinfo($filename, PATHINFO_EXTENSION);
        $newName = Str::slug($sample->voice->user->name.'-'.$sample->voice->title);

        return Storage::disk('public')->download(
            'samples/'.$filename,
            $newName . '.' . $extension
        );

    }
}
