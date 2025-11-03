<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Validation\Rule;
use Mcamara\LaravelLocalization\Facades\LaravelLocalization;

class VoiceFeatureValueFormRequest extends FormRequest
{
    public function authorize(): bool
    {
        return true;
    }

    public function rules(): array
    {


        if ($this->isMethod('POST')) {
            return [
                'voice_id' => ['required', 'int', 'exists:voices,id'],
                'feature_id' => ['required', 'int', 'exists:features,id'],
            ];
        }

        return [
            'voice_id' => ['sometimes', 'int', 'exists:voices,id'],
            'feature_value_id' => ['sometimes', 'int', 'exists:feature_values,id'],
        ];
    }
}
