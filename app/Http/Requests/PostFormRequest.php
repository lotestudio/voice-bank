<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Validation\Rule;

class PostFormRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return auth()->user()?->isAdmin();
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {

        return [
            'title' => ['required', 'array'],
            'title.*' => ['required', 'string', 'max:255', 'min:2'],
            'excerpt' => ['nullable', 'array'],
            'excerpt.*' => ['nullable', 'string'],
            'body' => ['nullable', 'array'],
            'body.*' => ['nullable', 'string'],
            'position' => ['nullable', 'integer'],
            'section' => ['nullable', 'string', 'max:255'],
            'is_published' => ['nullable', 'boolean'],
        ];
    }
}
