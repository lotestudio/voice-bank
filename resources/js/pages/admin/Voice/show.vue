<script setup lang="ts">
import { Head, router, usePage } from '@inertiajs/vue3';
import AppLayout from '@/layouts/AppLayout.vue';
import { Button } from '@/components/ui/button';
import LoteSelect from '@/components/LoteSelect.vue';
import { ref } from 'vue';
import VoiceFeatureValueController from '@/actions/App/Http/Controllers/Admin/VoiceFeatureValueController';
import LoteTags from '@/components/LoteTags.vue';
import { toast } from 'vue-sonner';

const page = usePage();

const data = ref(page.props.selected);

const new_feature_id = ref();

const add_new_feature = () => {
    router.post(
        VoiceFeatureValueController.store().url,
        {
            voice_id: page.props.voice.id,
            feature_id: new_feature_id.value,
        },
        {
            preserveScroll: true,
            onSuccess: () => {
                new_feature_id.value='';
            },
        },
    );
};
const save = () => {
    router.post(
        VoiceFeatureValueController.update().url,
        {
            voice_id: page.props.voice.id,
            values: data.value,
        },
        {
            preserveScroll: true,
            onSuccess: () => {
                toast.success('Values saved!')
            },
        },
    );
};
</script>

<template>
    <AppLayout :breadcrumbs="[]" >
        <Head title="Show" />
        <div class="p-4">
            <h1 class="text-2xl font-bold">{{ page.props.voice.title.en }}/{{ page.props.voice.user.name }}</h1>
            <hr />
            <div class="mt-4">
                <div class="mb-2 flex max-w-4xl items-center justify-between">
                    <h2 class="text-xl font-semibold">Feature Values:</h2>
                    <div class="flex items-center gap-2">
                        <LoteSelect :selected="new_feature_id" :disabled=page.props.disabledFeatureIds :options="page.props.featuresSelect" @change="new_feature_id = $event" />
                        <Button variant="outline" size="sm" class="mr-2" @click="add_new_feature">Add Feature</Button>
                    </div>
                </div>
                <div
                    v-for="feature in page.props.featureValues"
                    :key="feature.id"
                    class="mb-2 flex max-w-4xl items-center justify-between gap-2 rounded border p-2"
                    :class="feature.is_featured ? 'bg-secondary-foreground text-black' : ''"
                >
                    <div class="w-60">
                        {{feature.name}}:
                    </div>
                    <div class="flex-1">
                        <LoteSelect v-if="feature.is_featured" :options="feature.forSelect" :selected="feature.selected[0]" @change="data[feature.id] = $event" />
                        <LoteTags v-else :options="feature.forSelect" :selected="feature.selected" @change="data[feature.id] = $event"/>
                    </div>
                </div>
            </div>
            <hr class="my-4 max-w-4xl" />
            <div>
                <Button variant="secondary" size="sm" class="mr-2" @click="save()">Save</Button>
            </div>
        </div>
    </AppLayout>
</template>
