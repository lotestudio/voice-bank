<script setup lang="ts">
import { Head, router, usePage } from '@inertiajs/vue3';
import AppLayout from '@/layouts/AppLayout.vue';
import { Button } from '@/components/ui/button';
import LoteSelect from '@/components/LoteSelect.vue';
import { ref } from 'vue';
import LoteAlertDialog from '@/components/LoteAlertDialog.vue';
import VoiceFeatureValueController from '@/actions/App/Http/Controllers/Admin/VoiceFeatureValueController';
import { toast } from 'vue-sonner';

const page = usePage();
const voice = page.props.voice;

toast.success('The VoiceFeatureValue has been deleted successfully.')

const detach = (id: number) => {
    console.log(id);
    toast.success('The VoiceFeatureValue has been deleted successfully.')
    // router.delete(VoiceFeatureValueController.destroy(id).url, {
    //     preserveScroll: true,
    //     onSuccess: () => {
    //         //router.reload();
    //         toast.success('The VoiceFeatureValue has been deleted successfully.')
    //     },
    // });
};

const features_colors = ref([
    { class: 'border-blue-500 bg-blue-400/10', key: null },
    { class: 'border-green-500 bg-green-400/10', key: null },
    { class: 'border-red-500 bg-red-400/10', key: null },
    { class: 'border-yellow-500 bg-yellow-400/10', key: null },
    { class: 'border-purple-500 bg-purple-400/10', key: null },
    { class: 'border-pink-500 bg-pink-400/10', key: null },
    { class: 'border-teal-500 bg-teal-400/10', key: null },
    { class: 'border-cyan-500 bg-cyan-400/10', key: null },
    { class: 'border-amber-500 bg-amber-400/10', key: null },
    { class: 'border-lime-500 bg-lime-400/10', key: null },
    { class: 'border-emerald-500 bg-emerald-400/10', key: null },
    { class: 'border-indigo-500 bg-indigo-400/10', key: null },
    { class: 'border-sky-500 bg-sky-400/10', key: null },
    { class: 'border-violet-500 bg-violet-400/10', key: null },
    { class: 'border-fuchsia-500 bg-fuchsia-400/10', key: null },
    { class: 'border-rose-500 bg-rose-400/10', key: null },
    { class: 'border-slate-500 bg-slate-400/10', key: null },
    { class: 'border-zinc-500 bg-zinc-400/10', key: null },
    { class: 'border-stone-500 bg-stone-400/10', key: null },
    { class: 'border-neutral-500 bg-neutral-400/10', key: null },
]);

const getColor = (key: string) => {
    // Check if key already exists
    const existingColor = features_colors.value.find((color) => color.key === key);
    if (existingColor) {
        return existingColor.class;
    }

    // Find first null key and assign new key
    const nextEmptyColor = features_colors.value.find((color) => color.key === null);
    if (nextEmptyColor) {
        nextEmptyColor.key = key;
        return nextEmptyColor.class;
    }

    // If no empty slots, return first color class as fallback
    return features_colors.value[0].class;
};

const new_feature_id = ref();

const add_new_feature = () => {
    // axios.delete(VoiceFeatureValueController.destroy())
};
</script>

<template>
    <AppLayout :breadcrumbs="[]">
        <Head title="Show" />
        <div class="p-4">
            <h1 class="text-2xl font-bold">{{ voice.title.en }}/{{ voice.user.name }}</h1>

            <hr />
            <!--            <pre>-->
            <!--                {{ voice }}-->
            <!--            </pre>-->

            <div class="mt-4">
                <div class="mb-2 flex max-w-4xl items-center justify-between">
                    <h2 class="text-xl font-semibold">Feature Values:</h2>
                    <div class="flex items-center gap-2">
                        <LoteSelect :options="page.props.featuresSelect" @change="new_feature_id = $event" />
                        <Button variant="outline" size="sm" class="mr-2" @click="add_new_feature">Add Feature</Button>
                    </div>
                </div>

                <div
                    v-for="featureValue in voice.feature_values"
                    :key="featureValue.id"
                    class="mb-2 flex max-w-4xl items-center justify-between rounded border p-2"
                    :class="featureValue.feature.is_featured ? 'border-orange-500 bg-orange-400/10' : getColor(featureValue.feature.display_name?.en)"
                >
                    <div>
                        <div class="font-medium">
                            {{ featureValue.display_value?.en }}
                        </div>
                        <div class="text-sm text-gray-600">{{ featureValue.description?.en }}</div>
                    </div>
                    <div class="flex items-center gap-2">
                        <div class="text-xs font-bold">
                            {{ featureValue.feature.display_name?.en }}
                        </div>

                        <LoteAlertDialog
                            dialog-title="Detach Feature Value"
                            dialog-description="Are you sure you want to unlink this Feature Value from this Voice?"
                            confirm-label="Detach"
                            @confirm="detach(featureValue.id)"
                            v-if="!featureValue.feature.is_featured"
                        >
                            <Button variant="destructive" size="icon">
                                <span class="i-close"></span>
                            </Button>
                        </LoteAlertDialog>
                    </div>
                </div>
            </div>
        </div>
    </AppLayout>
</template>
