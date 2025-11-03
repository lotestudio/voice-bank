<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\VoiceFeatureValueFormRequest;
use App\Models\Feature;
use App\Models\FeatureValue;
use App\Models\VoiceFeatureValue;
use Illuminate\Http\RedirectResponse;
use Illuminate\Routing\Redirector;

class VoiceFeatureValueController extends Controller
{
    public function store(VoiceFeatureValueFormRequest $request)
    {
        $data = $request->validated();

        $featureValueId = FeatureValue::query()->where('feature_values.feature_id', $data['feature_id'])->first()->id;

        $v = VoiceFeatureValue::query()->create([
            'feature_value_id' => $featureValueId,
            'voice_id' => $data['voice_id'],
        ]);

        return back();
    }

    public function update(VoiceFeatureValue $voiceFeatureValue, VoiceFeatureValueFormRequest $request)
    {
        $data = $request->validated();
        $voiceFeatureValue->update($data);

        return back();
    }

    public function destroy($id)
    {
        VoiceFeatureValue::destroy([$id]);
        return back();
    }
}
