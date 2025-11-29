<?php

declare(strict_types=1);

namespace App\Traits;

use App\Http\Controllers\UI\FileUploadController;
use Illuminate\Support\Facades\Storage;

trait HasUploadedFile
{
    public function moveFileFromTmp(string $toFolder, $filePathToMove): string
    {
        if ($this->file === $filePathToMove) {
            return $this->file;
        }

        $disk = Storage::disk('public');

        $fileName = cache($filePathToMove) ?? basename($filePathToMove);
        $newPath = $toFolder.'/'.$fileName;

        if (str_starts_with($filePathToMove, FileUploadController::TMP_FOLDER)) {

            $name = pathinfo($fileName, PATHINFO_FILENAME); // filename
            $ext = pathinfo($fileName, PATHINFO_EXTENSION); // ext

            $counter = 1;

            // проверяваме дали вече съществува файл с такова име
            while ($disk->exists($newPath)) {
                $newFilename = $name.'_'.$counter.($ext !== '' && $ext !== '0' ? '.'.$ext : '');
                $newPath = $toFolder.'/'.$newFilename;
                $counter++;
            }

            $disk->move($filePathToMove, $newPath);
        }

        if (! is_null($this->file) && $disk->exists($toFolder.'/'.$this->file)) {
            $disk->delete($toFolder.'/'.$this->file);
        }

        return basename($newPath);
    }
}
