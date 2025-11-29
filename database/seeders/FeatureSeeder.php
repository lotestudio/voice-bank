<?php

namespace Database\Seeders;

use App\Models\Feature;
use App\Models\FeatureValue;
use Illuminate\Database\Seeder;

class FeatureSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Timbre feature
        $timbre = Feature::create([
            'name' => 'timbre',
            'display_name' => [
                'en' => 'Timbre',
                'bg' => 'Тембър',
            ],
            'description' => [
                'en' => 'The quality of the voice',
                'bg' => 'Качеството на гласа',
            ],
            'is_featured' => true,
            'sort_order' => 1,
        ]);

        // Timbre values with translations
        $timbreValues = [
            'high' => ['en' => 'High', 'bg' => 'Висок'],
            'medium' => ['en' => 'Medium', 'bg' => 'Среден'],
            'low' => ['en' => 'Low', 'bg' => 'Нисък'],
            'raspy' => ['en' => 'Raspy', 'bg' => 'Дрезгав'],
            'smooth' => ['en' => 'Smooth', 'bg' => 'Гладък'],
            'warm' => ['en' => 'Warm', 'bg' => 'Топъл'],
            'bright' => ['en' => 'Bright', 'bg' => 'Ярък'],
        ];

        $index = 1;
        foreach ($timbreValues as $value => $translations) {
            FeatureValue::create([
                'feature_id' => $timbre->id,
                'value' => $value,
                'display_value' => $translations,
                'description' => [
                    'en' => 'A '.strtolower($translations['en']).' voice timbre',
                    'bg' => $translations['bg'].' тембър на гласа',
                ],
                'sort_order' => $index++,
            ]);
        }

        // Gender feature
        $gender = Feature::create([
            'name' => 'gender',
            'display_name' => [
                'en' => 'Gender',
                'bg' => 'Пол',
            ],
            'description' => [
                'en' => 'The gender of the voice',
                'bg' => 'Полът на гласа',
            ],
            'is_featured' => true,
            'sort_order' => 2,
        ]);

        // Gender values with translations
        $genderValues = [
            'male' => ['en' => 'Male', 'bg' => 'Мъжки'],
            'female' => ['en' => 'Female', 'bg' => 'Женски'],
            'neutral' => ['en' => 'Neutral', 'bg' => 'Неутрален'],
        ];

        $index = 1;
        foreach ($genderValues as $value => $translations) {
            FeatureValue::create([
                'feature_id' => $gender->id,
                'value' => $value,
                'display_value' => $translations,
                'description' => [
                    'en' => 'A '.strtolower($translations['en']).' voice',
                    'bg' => $translations['bg'].' глас',
                ],
                'sort_order' => $index++,
            ]);
        }

        // Age feature
        $age = Feature::create([
            'name' => 'age',
            'display_name' => [
                'en' => 'Age',
                'bg' => 'Възраст',
            ],
            'description' => [
                'en' => 'The age range of the voice',
                'bg' => 'Възрастовият диапазон на гласа',
            ],
            'is_featured' => true,
            'sort_order' => 3,
        ]);

        // Age values with translations
        $ageValues = [
            'child' => ['en' => 'Child', 'bg' => 'Дете'],
            'teen' => ['en' => 'Teen', 'bg' => 'Тийнейджър'],
            'young_adult' => ['en' => 'Young Adult', 'bg' => 'Млад възрастен'],
            'adult' => ['en' => 'Adult', 'bg' => 'Възрастен'],
            'senior' => ['en' => 'Senior', 'bg' => 'Възрастен човек'],
        ];

        $index = 1;
        foreach ($ageValues as $value => $translations) {
            FeatureValue::create([
                'feature_id' => $age->id,
                'value' => $value,
                'display_value' => $translations,
                'description' => [
                    'en' => 'A voice of a '.strtolower($translations['en']),
                    'bg' => 'Глас на '.$translations['bg'],
                ],
                'sort_order' => $index++,
            ]);
        }

        // Accent feature
        $accent = Feature::create([
            'name' => 'accent',
            'display_name' => [
                'en' => 'Accent',
                'bg' => 'Акцент',
            ],
            'description' => [
                'en' => 'The accent of the voice',
                'bg' => 'Акцентът на гласа',
            ],
            'is_featured' => false,
            'sort_order' => 4,
        ]);

        // Accent values with translations
        $accentValues = [
            'american' => ['en' => 'American', 'bg' => 'Американски'],
            'british' => ['en' => 'British', 'bg' => 'Британски'],
            'australian' => ['en' => 'Australian', 'bg' => 'Австралийски'],
            'indian' => ['en' => 'Indian', 'bg' => 'Индийски'],
            'spanish' => ['en' => 'Spanish', 'bg' => 'Испански'],
            'french' => ['en' => 'French', 'bg' => 'Френски'],
            'german' => ['en' => 'German', 'bg' => 'Немски'],
            'italian' => ['en' => 'Italian', 'bg' => 'Италиански'],
            'russian' => ['en' => 'Russian', 'bg' => 'Руски'],
        ];

        $index = 1;
        foreach ($accentValues as $value => $translations) {
            FeatureValue::create([
                'feature_id' => $accent->id,
                'value' => $value,
                'display_value' => $translations,
                'description' => [
                    'en' => 'A voice with '.strtolower($translations['en']).' accent',
                    'bg' => 'Глас с '.$translations['bg'].' акцент',
                ],
                'sort_order' => $index++,
            ]);
        }

        // Style feature
        $style = Feature::create([
            'name' => 'style',
            'display_name' => [
                'en' => 'Style',
                'bg' => 'Стил',
            ],
            'description' => [
                'en' => 'The style of the voice',
                'bg' => 'Стилът на гласа',
            ],
            'is_featured' => false,
            'sort_order' => 5,
        ]);

        // Style values with translations
        $styleValues = [
            'conversational' => ['en' => 'Conversational', 'bg' => 'Разговорен'],
            'professional' => ['en' => 'Professional', 'bg' => 'Професионален'],
            'dramatic' => ['en' => 'Dramatic', 'bg' => 'Драматичен'],
            'cheerful' => ['en' => 'Cheerful', 'bg' => 'Весел'],
            'serious' => ['en' => 'Serious', 'bg' => 'Сериозен'],
            'energetic' => ['en' => 'Energetic', 'bg' => 'Енергичен'],
            'calm' => ['en' => 'Calm', 'bg' => 'Спокоен'],
        ];

        $index = 1;
        foreach ($styleValues as $value => $translations) {
            FeatureValue::create([
                'feature_id' => $style->id,
                'value' => $value,
                'display_value' => $translations,
                'description' => [
                    'en' => 'A '.strtolower($translations['en']).' voice style',
                    'bg' => $translations['bg'].' стил на гласа',
                ],
                'sort_order' => $index++,
            ]);
        }

        // Language feature
        $language = Feature::create([
            'name' => 'language',
            'display_name' => [
                'en' => 'Language',
                'bg' => 'Език',
            ],
            'description' => [
                'en' => 'The language the voice actor can speak',
                'bg' => 'Езикът, на който гласовият актьор може да говори',
            ],
            'is_featured' => false,
            'sort_order' => 6,
        ]);

        // Language values with translations
        $languageValues = [
            'english' => ['en' => 'English', 'bg' => 'Английски'],
            'russian' => ['en' => 'Russian', 'bg' => 'Руски'],
            'bulgarian' => ['en' => 'Bulgarian', 'bg' => 'Български'],
            'spanish' => ['en' => 'Spanish', 'bg' => 'Испански'],
            'french' => ['en' => 'French', 'bg' => 'Френски'],
            'german' => ['en' => 'German', 'bg' => 'Немски'],
            'italian' => ['en' => 'Italian', 'bg' => 'Италиански'],
            'portuguese' => ['en' => 'Portuguese', 'bg' => 'Португалски'],
            'chinese' => ['en' => 'Chinese', 'bg' => 'Китайски'],
            'japanese' => ['en' => 'Japanese', 'bg' => 'Японски'],
            'korean' => ['en' => 'Korean', 'bg' => 'Корейски'],
        ];

        $index = 1;
        foreach ($languageValues as $value => $translations) {
            FeatureValue::create([
                'feature_id' => $language->id,
                'value' => $value,
                'display_value' => $translations,
                'description' => [
                    'en' => 'Can speak '.$translations['en'],
                    'bg' => 'Може да говори '.$translations['bg'],
                ],
                'sort_order' => $index++,
            ]);
        }

        // Price Range feature
        $priceRange = Feature::create([
            'name' => 'price-range',
            'display_name' => [
                'en' => 'Price Range',
                'bg' => 'Ценови диапазон',
            ],
            'description' => [
                'en' => 'The price range for the voice actor',
                'bg' => 'Ценовият диапазон за гласовия актьор',
            ],
            'is_featured' => false,
            'sort_order' => 7,
        ]);

        // Price Range values with translations
        $priceRangeValues = [
            'economy' => ['en' => 'Economy', 'bg' => 'Икономичен'],
            'standard' => ['en' => 'Standard', 'bg' => 'Стандартен'],
            'premium' => ['en' => 'Premium', 'bg' => 'Премиум'],
            'professional' => ['en' => 'Professional', 'bg' => 'Професионален'],
            'enterprise' => ['en' => 'Enterprise', 'bg' => 'Корпоративен'],
        ];

        $index = 1;
        foreach ($priceRangeValues as $value => $translations) {
            FeatureValue::create([
                'feature_id' => $priceRange->id,
                'value' => $value,
                'display_value' => $translations,
                'description' => [
                    'en' => $translations['en'].' price range',
                    'bg' => $translations['bg'].' ценови диапазон',
                ],
                'sort_order' => $index++,
            ]);
        }

        // Category feature
        $category = Feature::create([
            'name' => 'category',
            'display_name' => [
                'en' => 'Category',
                'bg' => 'Категория',
            ],
            'description' => [
                'en' => 'The category of voice work',
                'bg' => 'Категорията на гласовата работа',
            ],
            'is_featured' => false,
            'sort_order' => 8,
        ]);

        // Category values with translations
        $categoryValues = [
            'commercial' => ['en' => 'Commercial', 'bg' => 'Реклама'],
            'narration' => ['en' => 'Narration', 'bg' => 'Разказ'],
            'audiobook' => ['en' => 'Audiobook', 'bg' => 'Аудиокнига'],
            'animation' => ['en' => 'Animation', 'bg' => 'Анимация'],
            'video-game' => ['en' => 'Video Game', 'bg' => 'Видео игра'],
            'documentary' => ['en' => 'Documentary', 'bg' => 'Документален'],
            'e-learning' => ['en' => 'E-Learning', 'bg' => 'Електронно обучение'],
            'ivr' => ['en' => 'IVR/Phone System', 'bg' => 'IVR/Телефонна система'],
            'podcast' => ['en' => 'Podcast', 'bg' => 'Подкаст'],
            'radio' => ['en' => 'Radio', 'bg' => 'Радио'],
            'tv' => ['en' => 'TV', 'bg' => 'Телевизия'],
        ];

        $index = 1;
        foreach ($categoryValues as $value => $translations) {
            FeatureValue::create([
                'feature_id' => $category->id,
                'value' => $value,
                'display_value' => $translations,
                'description' => [
                    'en' => 'Voice for '.strtolower($translations['en']),
                    'bg' => 'Глас за '.$translations['bg'],
                ],
                'sort_order' => $index++,
            ]);
        }

        // Delivery Time feature
        $deliveryTime = Feature::create([
            'name' => 'delivery-time',
            'display_name' => [
                'en' => 'Delivery Time',
                'bg' => 'Време за доставка',
            ],
            'description' => [
                'en' => 'The estimated delivery time',
                'bg' => 'Очакваното време за доставка',
            ],
            'is_featured' => false,
            'sort_order' => 9,
        ]);

        // Delivery Time values with translations
        $deliveryTimeValues = [
            '24h' => ['en' => '24 Hours', 'bg' => '24 часа'],
            '48h' => ['en' => '48 Hours', 'bg' => '48 часа'],
            '3-5d' => ['en' => '3-5 Days', 'bg' => '3-5 дни'],
            '1w' => ['en' => '1 Week', 'bg' => '1 седмица'],
            'custom' => ['en' => 'Custom', 'bg' => 'По договаряне'],
        ];

        $index = 1;
        foreach ($deliveryTimeValues as $value => $translations) {
            FeatureValue::create([
                'feature_id' => $deliveryTime->id,
                'value' => $value,
                'display_value' => $translations,
                'description' => [
                    'en' => 'Delivery within '.strtolower($translations['en']),
                    'bg' => 'Доставка в рамките на '.$translations['bg'],
                ],
                'sort_order' => $index++,
            ]);
        }

        // Experience Level feature
        $experienceLevel = Feature::create([
            'name' => 'experience-level',
            'display_name' => [
                'en' => 'Experience Level',
                'bg' => 'Ниво на опит',
            ],
            'description' => [
                'en' => 'The experience level of the voice actor',
                'bg' => 'Нивото на опит на гласовия актьор',
            ],
            'is_featured' => false,
            'sort_order' => 11,
        ]);

        // Experience Level values with translations
        $experienceLevelValues = [
            'beginner' => ['en' => 'Beginner', 'bg' => 'Начинаещ'],
            'intermediate' => ['en' => 'Intermediate', 'bg' => 'Среден'],
            'experienced' => ['en' => 'Experienced', 'bg' => 'Опитен'],
            'professional' => ['en' => 'Professional', 'bg' => 'Професионален'],
            'expert' => ['en' => 'Expert', 'bg' => 'Експерт'],
        ];

        $index = 1;
        foreach ($experienceLevelValues as $value => $translations) {
            FeatureValue::create([
                'feature_id' => $experienceLevel->id,
                'value' => $value,
                'display_value' => $translations,
                'description' => [
                    'en' => $translations['en'].' voice actor',
                    'bg' => $translations['bg'].' актьор',
                ],
                'sort_order' => $index++,
            ]);
        }

    }
}
