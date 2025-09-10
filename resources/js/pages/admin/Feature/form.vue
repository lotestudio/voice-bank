<script setup lang="ts">
import MultilangInput from '@/components/MultilangInput.vue';
import { Button } from '@/components/ui/button';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, useForm, usePage } from '@inertiajs/vue3';
import LoteSwitch from '@/components/LoteSwitch.vue';
import InputError from '@/components/InputError.vue';
import { Input } from '@/components/ui/input';

const page = usePage();
const isEdit = !!page.props.model;
const form = useForm({
    display_name: page.props.model?.display_name ?? '',
    is_filterable: page.props.model?.is_filterable ?? true,
    sort_order: page.props.model?.sort_order ?? null,
});

function submit() {
    if (isEdit) {
        form.put('/admin/feature/' + page.props.model.id);
    } else {
        form.post('/admin/feature');
    }
}
</script>

<template>
    <AppLayout :breadcrumbs="[]">
        <Head :title="isEdit ? 'Edit Feature' : 'Create Feature'" />
        <div class="max-w-xl p-4">
            <form @submit.prevent="submit" class="space-y-4">
                <MultilangInput v-model="form.display_name" :errors="form.errors" label="Display name" as="Input" />

                <div class="flex items-center gap-2">
                    <label for="sort_order" class="block text-sm font-medium">Order:</label>
                    <Input id="sort_order" type="number" class="block w-full" v-model="form.sort_order" />
                </div>
                <div class="flex items-center gap-2">
                    <label class="block text-sm font-medium">Filterable:</label>
                    <LoteSwitch :default-state="form.is_filterable" @change="form.is_filterable = $event" />
                </div>
                <InputError class="mt-2" :message="form.errors.order" />

                <Button :disabled="form.processing">Save</Button>
            </form>
        </div>
    </AppLayout>
</template>
