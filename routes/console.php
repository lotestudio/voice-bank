<?php

use Illuminate\Support\Facades\Artisan;

Artisan::command('dev:download_db', function () {
    $dumper = new \App\Lote\Services\DevDBSync\Dumper();

    $this->info($dumper->dumpDb(true));
    $this->info($dumper->download(true));
    $this->info($dumper->deleteDumpFile(true));

})->describe('Download database from production');
