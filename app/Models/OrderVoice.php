<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Relations\Pivot;

class OrderVoice extends Pivot
{
    protected $table = 'order_voice';

    public $incrementing = true;
}
