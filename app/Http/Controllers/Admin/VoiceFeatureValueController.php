<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\FeatureValue;
use App\Models\Voice;
use App\Models\VoiceFeatureValue;
use Illuminate\Http\Request;

class VoiceFeatureValueController extends Controller
{
    public function store(Request $request)
    {
        $data = $request->validate([
            'feature_id' => 'required',
            'voice_id' => 'required',
        ]);

        $featureValueId = FeatureValue::query()->where('feature_values.feature_id', $data['feature_id'])->first()->id;

        VoiceFeatureValue::query()->create([
            'feature_value_id' => $featureValueId,
            'voice_id' => $data['voice_id'],
        ]);

        return back();
    }

    public function update(Request $request)
    {
        $data = $request->validate([
            'voice_id' => 'required',
            'values' => 'required|array',
        ]);

        $values = collect($data['values'])->flatten()->unique()->toArray();

        Voice::query()->find($data['voice_id'])->featureValues()->sync($values);

        return back();
    }
}
