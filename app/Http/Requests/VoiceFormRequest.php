<?php

declare(strict_types=1);

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class VoiceFormRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        return [
            'title' => ['required', 'array', 'max:255'],
            'is_active' => 'required|boolean',
            'user_id' => 'required|integer',
        ];
    }
}
