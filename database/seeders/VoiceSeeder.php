<?php

namespace Database\Seeders;

use App\Models\Feature;
use App\Models\FeatureValue;
use App\Models\User;
use App\Models\Voice;
use Illuminate\Database\Seeder;

class VoiceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // Get all artists
        $artists = User::where('role', 'artist')->get();

        // Get features and their values
        $timbreFeature = Feature::where('name', 'timbre')->first();
        $timbreValues = $timbreFeature ? $timbreFeature->values : collect();

        $genderFeature = Feature::where('name', 'gender')->first();
        $genderValues = $genderFeature ? $genderFeature->values : collect();

        $ageFeature = Feature::where('name', 'age')->first();
        $ageValues = $ageFeature ? $ageFeature->values : collect();

        $accentFeature = Feature::where('name', 'accent')->first();
        $accentValues = $accentFeature ? $accentFeature->values : collect();

        $styleFeature = Feature::where('name', 'style')->first();
        $styleValues = $styleFeature ? $styleFeature->values : collect();

        // Get new features and their values
        $languageFeature = Feature::where('name', 'language')->first();
        $languageValues = $languageFeature ? $languageFeature->values : collect();

        $priceRangeFeature = Feature::where('name', 'price-range')->first();
        $priceRangeValues = $priceRangeFeature ? $priceRangeFeature->values : collect();

        $categoryFeature = Feature::where('name', 'category')->first();
        $categoryValues = $categoryFeature ? $categoryFeature->values : collect();

        $deliveryTimeFeature = Feature::where('name', 'delivery-time')->first();
        $deliveryTimeValues = $deliveryTimeFeature ? $deliveryTimeFeature->values : collect();

        $ratingFeature = Feature::where('name', 'rating')->first();
        $ratingValues = $ratingFeature ? $ratingFeature->values : collect();

        $experienceLevelFeature = Feature::where('name', 'experience-level')->first();
        $experienceLevelValues = $experienceLevelFeature ? $experienceLevelFeature->values : collect();

        $availabilityFeature = Feature::where('name', 'availability')->first();
        $availabilityValues = $availabilityFeature ? $availabilityFeature->values : collect();

        // Create voices for each artist
        foreach ($artists as $artist) {
            // Each artist will have 1-3 voices
            $voiceCount = rand(1, 3);

            for ($i = 0; $i < $voiceCount; $i++) {
                $englishTitle = fake()->sentence(3);
                $englishDescription = fake()->paragraph();

                $voice = Voice::create([
                    'user_id' => $artist->id,
                    'title' => [
                        'en' => $englishTitle,
                        'bg' => 'БГ: ' . $englishTitle // Placeholder for Bulgarian translation
                    ],
                    'description' => [
                        'en' => $englishDescription,
                        'bg' => 'БГ: ' . $englishDescription // Placeholder for Bulgarian translation
                    ],
                    'is_active' => rand(0, 10) > 1, // 90% chance of being active
                ]);

                // Assign random feature values to the voice
                if ($timbreValues->count() > 0) {
                    $voice->featureValues()->attach($timbreValues->random()->id);
                }

                if ($genderValues->count() > 0) {
                    $voice->featureValues()->attach($genderValues->random()->id);
                }

                if ($ageValues->count() > 0) {
                    $voice->featureValues()->attach($ageValues->random()->id);
                }

                if ($accentValues->count() > 0) {
                    $voice->featureValues()->attach($accentValues->random()->id);
                }

                // For style, randomly assign 1-3 styles
                if ($styleValues->count() > 0) {
                    $styleCount = rand(1, min(3, $styleValues->count()));
                    $selectedStyles = $styleValues->random($styleCount);

                    foreach ($selectedStyles as $style) {
                        $voice->featureValues()->attach($style->id);
                    }
                }

                // Assign random language values (1-2)
                if ($languageValues->count() > 0) {
                    $languageCount = rand(1, min(2, $languageValues->count()));
                    $selectedLanguages = $languageValues->random($languageCount);

                    foreach ($selectedLanguages as $language) {
                        $voice->featureValues()->attach($language->id);
                    }
                }

                // Assign random price range (1)
                if ($priceRangeValues->count() > 0) {
                    $voice->featureValues()->attach($priceRangeValues->random()->id);
                }

                // Assign random categories (1-3)
                if ($categoryValues->count() > 0) {
                    $categoryCount = rand(1, min(3, $categoryValues->count()));
                    $selectedCategories = $categoryValues->random($categoryCount);

                    foreach ($selectedCategories as $category) {
                        $voice->featureValues()->attach($category->id);
                    }
                }

                // Assign random delivery time (1)
                if ($deliveryTimeValues->count() > 0) {
                    $voice->featureValues()->attach($deliveryTimeValues->random()->id);
                }

                // Assign random rating (1)
                if ($ratingValues->count() > 0) {
                    $voice->featureValues()->attach($ratingValues->random()->id);
                }

                // Assign random experience level (1)
                if ($experienceLevelValues->count() > 0) {
                    $voice->featureValues()->attach($experienceLevelValues->random()->id);
                }

                // Assign random availability (1)
                if ($availabilityValues->count() > 0) {
                    $voice->featureValues()->attach($availabilityValues->random()->id);
                }
            }
        }

        // Create some additional random voices
        Voice::factory()
            ->count(10)
            ->create()
            ->each(function ($voice) use (
                $timbreValues, $genderValues, $ageValues, $accentValues, $styleValues,
                $languageValues, $priceRangeValues, $categoryValues, $deliveryTimeValues,
                $ratingValues, $experienceLevelValues, $availabilityValues
            ) {
                // Assign core feature values
                if ($timbreValues->count() > 0) {
                    $voice->featureValues()->attach($timbreValues->random()->id);
                }

                if ($genderValues->count() > 0) {
                    $voice->featureValues()->attach($genderValues->random()->id);
                }

                if ($ageValues->count() > 0) {
                    $voice->featureValues()->attach($ageValues->random()->id);
                }

                if ($accentValues->count() > 0) {
                    $voice->featureValues()->attach($accentValues->random()->id);
                }

                // For style, randomly assign 1-3 styles
                if ($styleValues->count() > 0) {
                    $styleCount = rand(1, min(3, $styleValues->count()));
                    $selectedStyles = $styleValues->random($styleCount);

                    foreach ($selectedStyles as $style) {
                        $voice->featureValues()->attach($style->id);
                    }
                }

                // Assign random language values (1-2)
                if ($languageValues->count() > 0) {
                    $languageCount = rand(1, min(2, $languageValues->count()));
                    $selectedLanguages = $languageValues->random($languageCount);

                    foreach ($selectedLanguages as $language) {
                        $voice->featureValues()->attach($language->id);
                    }
                }

                // Assign random price range (1)
                if ($priceRangeValues->count() > 0) {
                    $voice->featureValues()->attach($priceRangeValues->random()->id);
                }

                // Assign random categories (1-3)
                if ($categoryValues->count() > 0) {
                    $categoryCount = rand(1, min(3, $categoryValues->count()));
                    $selectedCategories = $categoryValues->random($categoryCount);

                    foreach ($selectedCategories as $category) {
                        $voice->featureValues()->attach($category->id);
                    }
                }

                // Assign random delivery time (1)
                if ($deliveryTimeValues->count() > 0) {
                    $voice->featureValues()->attach($deliveryTimeValues->random()->id);
                }

                // Assign random rating (1)
                if ($ratingValues->count() > 0) {
                    $voice->featureValues()->attach($ratingValues->random()->id);
                }

                // Assign random experience level (1)
                if ($experienceLevelValues->count() > 0) {
                    $voice->featureValues()->attach($experienceLevelValues->random()->id);
                }

                // Assign random availability (1)
                if ($availabilityValues->count() > 0) {
                    $voice->featureValues()->attach($availabilityValues->random()->id);
                }
            });
    }
}
