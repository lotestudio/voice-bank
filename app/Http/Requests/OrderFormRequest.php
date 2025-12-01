<?php

declare(strict_types=1);

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class OrderFormRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        $rules = [
            'title' => ['required', 'string', 'max:255'],
            'description' => ['required', 'string', 'max:1000'],
            'script_text' => ['required', 'string'],
            'deadline' => ['required', 'date'],
        ];

        if (!request()->is('admin/*')) {
            $rules['voices'] = ['required', 'array'];
        }

        return $rules;
    }
}
