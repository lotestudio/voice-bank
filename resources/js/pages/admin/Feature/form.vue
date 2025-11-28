<script setup lang="ts">
import MultilangInput from '@/components/MultilangInput.vue';
import { Button } from '@/components/ui/button';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, useForm, usePage } from '@inertiajs/vue3';
import LoteSwitch from '@/components/LoteSwitch.vue';
import InputError from '@/components/InputError.vue';
import { Input } from '@/components/ui/input';
import {useInitialValue} from '@/composables/useInitialFormValue';

const page = usePage();
const { get, isEdit } = useInitialValue();
const form = useForm({
    display_name: get('display_name', {}, 'json'),
    is_featured: get('is_featured', true, 'boolean'),
    sort_order: get('sort_order', null, 'number'),
    return_url: get('return_url', null),
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
            <form @submit.prevent="submit" class="space-y-8">
                <MultilangInput v-model="form.display_name" :errors="form.errors" label="Display name" as="Input" />

                <div class="flex items-center gap-2">
                    <label for="sort_order" class="block text-sm font-medium">Order:</label>
                    <Input id="sort_order" type="number" class="block w-full" v-model="form.sort_order" />
                </div>
                <div class="flex items-center gap-2">
                    <label class="block text-sm font-medium">Featured:</label>
                    <LoteSwitch :default-state="form.is_featured" @change="form.is_featured = $event" />
                </div>
                <InputError class="mt-2" :message="form.errors.order" />

                <Button :disabled="form.processing">Save</Button>
            </form>
        </div>
    </AppLayout>
</template>
