<?php

namespace App\Services;

class OrderCalculator
{
    public const SINGLE_WORD_PRICE = 0.5;

    public const SINGLE_ARTIST_PRICE = 100;

    public static function getPrices(): array
    {
        return [
            'single_word_price' => self::SINGLE_WORD_PRICE,
            'single_artist_price' => self::SINGLE_ARTIST_PRICE,
        ];
    }

    public static function getTranslations(): array
    {
        return [
            'number_of_voices' => __('order_calculator.number_of_voices'),
            'word_count' => __('order_calculator.word_count'),
            'total_price' => __('order_calculator.total_price'),
            'price_per_voice' => __('order_calculator.price_per_voice'),
            'price_per_word' => __('order_calculator.price_per_word'),
            'approximate' => __('order_calculator.approximate'),
            'total_price_alert' => __('order_calculator.total_price_alert'),
        ];
    }
}
