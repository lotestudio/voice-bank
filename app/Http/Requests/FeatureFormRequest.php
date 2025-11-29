<?php

declare(strict_types=1);

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class FeatureFormRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        $rules = [
            'display_name' => ['required', 'array'],
            'sort_order' => 'nullable|integer|min:0',
            'is_featured' => 'boolean',
        ];

        foreach (LaravelLocalization::getSupportedLanguagesKeys() as $locale) {
            $rules['display_name.'.$locale] = ['required', 'string', 'max:255', 'min:2'];
        }

        return $rules;
    }
}
