<?php

declare(strict_types=1);

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class ReviewFormRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'voice_id' => 'required|integer',
            'order_id' => 'required|integer',
            'rating' => 'sometimes|nullable|integer',
            'comment' => 'sometimes|nullable|string',
            'approved' => 'sometimes|boolean',
        ];
    }
}
