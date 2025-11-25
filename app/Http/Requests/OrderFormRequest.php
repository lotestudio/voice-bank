<?php

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

        return [
            'title' => ['required', 'string', 'max:255'],
            'description' => ['required', 'string', 'max:1000'],
            'script_text' => ['required', 'string'],
            'deadline' => ['required', 'date'],
            'voices' => ['required', 'array'],
            //'voices.*' => ['required'],
        ];

    }
}
