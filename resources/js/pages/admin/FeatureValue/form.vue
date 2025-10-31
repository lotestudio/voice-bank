<script setup lang="ts">
import { Button } from '@/components/ui/button';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, useForm, usePage } from '@inertiajs/vue3';
import MultilangInput from '@/components/MultilangInput.vue';
import LoteSelect from '@/components/LoteSelect.vue';
import InputError from '@/components/InputError.vue';
import { Input } from '@/components/ui/input';

const page = usePage();
const isEdit = !!page.props.model;
const form = useForm({
    display_value: page.props.model?.display_value ?? {},
    description: page.props.model?.description ?? {},
    feature_id: page.props.model?.feature_id ?? null,
    sort_order: page.props.model?.sort_order ?? null,
});

function submit() {
    if (isEdit) {
        form.put('/admin/feature-value/' + page.props.model.id);
    } else {
        form.post('/admin/feature-value');
    }
}
</script>

<template>
    <AppLayout :breadcrumbs="[]">
        <Head :title="isEdit ? 'Edit FeatureValue' : 'Create FeatureValue'" />
        <div class="max-w-xl p-4">
            <form @submit.prevent="submit" class="space-y-8">
                <MultilangInput v-model="form.display_value" :errors="form.errors" label="Display value" as="Input" />
                <MultilangInput v-model="form.description" :errors="form.errors" label="Description" as="Textarea" />
                <LoteSelect width_class="w-full"  :options="page.props.featureSelect" :selected="form.feature_id" @change="form.feature_id=$event"></LoteSelect>
                <InputError class="" :message="form.errors.feature_id" />
                <div class="flex items-center gap-2">
                    <label for="sort_order" class="block text-sm font-medium">Order:</label>
                    <Input id="sort_order" type="number" class="block w-full" v-model="form.sort_order" />
                </div>
                <InputError class="" :message="form.errors.order" />
                <Button :disabled="form.processing">Save</Button>
            </form>
        </div>
    </AppLayout>
</template>
