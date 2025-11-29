<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import LoteSwitch from '@/components/LoteSwitch.vue';
import MultilangInput from '@/components/MultilangInput.vue';
import { Button } from '@/components/ui/button';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, useForm, usePage } from '@inertiajs/vue3';
import LoteSelect from '@/components/LoteSelect.vue';
import {useInitialValue} from '@/composables/useInitialFormValue';

const page = usePage();
const { get, isEdit } = useInitialValue();
const form = useForm({
    title: get('title', '','json'),
    is_active: get('is_active', true, 'boolean'),
    user_id: get('user_id', null, 'number'),
    return_url: get('return_url', null),
});

function submit() {
    if (isEdit) {
        form.put('/admin/voice/' + page.props.model.id);
    } else {
        form.post('/admin/voice');
    }
}
</script>

<template>
    <AppLayout :breadcrumbs="[]">
        <Head :title="isEdit ? 'Edit Voice' : 'Create Voice'" />
        <div class="max-w-xl p-4">
            <form @submit.prevent="submit" class="space-y-8">
                <MultilangInput v-model="form.title" :errors="form.errors" label="Title" as="Input" />

                <div class="flex items-center gap-2">
                    <label class="block text-sm font-medium">Status:</label>
                    <LoteSwitch :default-state="form.is_active" @change="form.is_active = $event" />
                </div>
                <InputError class="mt-2" :message="form.errors.is_active" />

                <div class="flex items-center gap-2">
                    <label class="block text-sm font-medium">Artist:</label>
                    <LoteSelect width_class="w-full" :options="page.props.users" :selected="form.user_id" @change="form.user_id = $event"></LoteSelect>
                </div>
                <InputError class="mt-2" :message="form.errors.is_active" />

                <Button :disabled="form.processing">Save</Button>
            </form>
        </div>
    </AppLayout>
</template>
