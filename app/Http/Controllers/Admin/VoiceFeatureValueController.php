<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\VoiceFeatureValueFormRequest;
use App\Models\FeatureValue;
use App\Models\VoiceFeatureValue;
use Illuminate\Http\RedirectResponse;
use Illuminate\Routing\Redirector;

class VoiceFeatureValueController extends Controller
{

    public function store(VoiceFeatureValueFormRequest $request)
    {
        $data = $request->validated();
        featureValue::query()->create($data);

        return redirect(route('feature-value.index'));
    }

    public function update(VoiceFeatureValue $voiceFeatureValue, VoiceFeatureValueFormRequest $request)
    {
        $data = $request->validated();
        $voiceFeatureValue->update($data);

        return redirect(route('feature-value.index'));
    }


    public function destroy($id)
    {
        VoiceFeatureValue::destroy([$id]);
        return back();
    }
}
