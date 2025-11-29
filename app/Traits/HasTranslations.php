<?php

declare(strict_types=1);

namespace App\Traits;

use Spatie\Translatable\HasTranslations as BaseHasTranslations;

trait HasTranslations
{
    use BaseHasTranslations;

    /**
     * Convert the model instance to an array.
     */
    public function toArray(): array
    {
        $attributes = parent::toArray();
        foreach ($this->getTranslatableAttributes() as $translatableAttribute) {
            $attributes[$translatableAttribute] = $this->getTranslation($translatableAttribute, \App::getLocale());
        }

        return $attributes;
    }

    public function toArrayWithTranslations(): array
    {
        return parent::toArray();
    }
}
