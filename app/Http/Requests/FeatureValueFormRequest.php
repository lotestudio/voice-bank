<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class FeatureValueFormRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {
        $rules = [
            'display_value' => ['required', 'array'],
        ];

        foreach (LaravelLocalization::getSupportedLanguagesKeys() as $locale) {
            $rules["display_value.{$locale}"] = ['required', 'string', 'max:255', 'min:2'];
        }

        return $rules;

    }
}
