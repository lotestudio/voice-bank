<?php

declare(strict_types=1);

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class SampleFormRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        $rules = [
            'title' => ['required', 'array'],
            'voice_id' => 'required|integer',
            'file_url' => ['required', 'string'],
            'description' => 'nullable|array',
            'is_featured' => 'boolean',
        ];

        foreach (LaravelLocalization::getSupportedLanguagesKeys() as $locale) {
            $rules['title.'.$locale] = ['required', 'string', 'max:255', 'min:2'];
            $rules['description.'.$locale] = ['nullable', 'string'];
        }

        return $rules;

    }
}
