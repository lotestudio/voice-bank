<?php

declare(strict_types=1);

namespace App\Http\Controllers\UI;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;

final class FileUploadController extends Controller
{
    const TMP_FOLDER = 'tmp'; //save in public folder to easy manage permission when manipulate images after upload!!!

    public function process(Request $request): string
    {
        // We don't know the name of the file input, so we need to grab
        // all the files from the request and grab the first file.
        /** @var UploadedFile[] $files */
        $files = $request->allFiles();

        if (empty($files)) {
            abort(422, 'No files were uploaded.');
        }

        if (count($files) > 1) {
            abort(422, 'Only 1 file can be uploaded at a time.');
        }

        // Now that we know there's only one key, we can grab it to get
        // the file from the request.
        $requestKey = array_key_first($files);

        // If we are allowing multiple files to be uploaded, the field in the
        // request will be an array with a single file rather than just a
        // single file (e.g. - `csv[]` rather than `csv`). So we need to
        // grab the first file from the array. Otherwise, we can assume
        // the uploaded file is for a single file input and we can
        // grab it directly from the request.

        $file = is_array($request->file($requestKey))
            ? $request->file($requestKey)[0]
            : $request->file($requestKey);



        // Store the file in a temporary location and save the location
        $tmpFileName = $file->store(
            path: self::TMP_FOLDER , options: ['disk' => 'public']
        );

        // Cache the temporary file name and the original name for later use.
        cache()->put($tmpFileName, $file->getClientOriginalName());

        // return the saved location for FilePond to use.
        return $tmpFileName;
    }

    public function remove(Request $request): string
    {
        if ($request->get('file')) {
            Storage::delete($request->get('file'));
        }

        return 'success';
    }
}
