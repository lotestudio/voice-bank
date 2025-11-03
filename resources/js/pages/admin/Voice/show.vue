<script setup lang="ts">
import { Head, router, usePage } from '@inertiajs/vue3';
import AppLayout from '@/layouts/AppLayout.vue';
import { Button } from '@/components/ui/button';
import LoteSelect from '@/components/LoteSelect.vue';
import { computed, ref } from 'vue';
import LoteAlertDialog from '@/components/LoteAlertDialog.vue';
import VoiceFeatureValueController from '@/actions/App/Http/Controllers/Admin/VoiceFeatureValueController';
import { toast } from 'vue-sonner';

const page = usePage();
const voice = computed(() => page.props.voice);


const detach = (id: number) => {
    router.delete(VoiceFeatureValueController.destroy(id).url, {
        preserveScroll: true,
        onSuccess: () => {
            router.reload();
            toast.success('The VoiceFeatureValue has been deleted successfully.');
        },
    });
};

const new_feature_id = ref();

const add_new_feature = () => {
    router.post(
        VoiceFeatureValueController.store().url,
        {
            voice_id: voice.value.id,
            feature_id: new_feature_id.value,
        },
        {
            preserveScroll: true,
            onSuccess: () => {
                router.reload();
            },
        },
    );
};
</script>

<template>
    <AppLayout :breadcrumbs="[]" >
        <Head title="Show" />
        <div class="p-4">
            <h1 class="text-2xl font-bold">{{ voice.title.en }}/{{ voice.user.name }}</h1>
            <hr />
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
                    :class="featureValue.feature.is_featured ? 'border-orange-500 bg-orange-400/10' : ''"
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
                            @confirm="detach(featureValue.pivot.id)"
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
