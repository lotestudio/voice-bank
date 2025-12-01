<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Textarea } from '@/components/ui/textarea';
import { useInitialValue } from '@/composables/useInitialFormValue';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, useForm, usePage } from '@inertiajs/vue3';
import LoteDatePicker from '@/components/LoteDatePicker.vue';

const page = usePage();
const { get, isEdit } = useInitialValue();
const form = useForm({
    title: get('title', ''),
    description: get('description', ''),
    script_text: get('script_text', ''),
    deadline: get('deadline', ''),
    return_url: get('return_url', null),
});

function submit() {
    if (isEdit) {
        form.put('/admin/order/' + page.props.model.id);
    } else {
        form.post('/admin/order');
    }
}
</script>

<template>
    <AppLayout :breadcrumbs="[]">
        <Head :title="isEdit ? 'Edit Order' : 'Create Order'" />
        <div class="max-w-xl p-4">
            <form @submit.prevent="submit" class="space-y-8">
                <div class="grid grid-cols-1 gap-2 space-y-4 md:grid-cols-2 md:space-y-0">
                    <div class="grid gap-2">
                        <Label for="title">Project title</Label>
                        <Input id="title" class="block w-full" v-model="form.title" required autocomplete="name" />
                        <InputError class="mt-2" :message="form.errors.title" />
                    </div>
                    <div class="grid gap-2">
                        <Label for="script">Deadline</Label>
                        <LoteDatePicker :initial_date="form.deadline" @change="form.deadline = $event" placeholder="Pick a date" />
                        <InputError class="mt-2" :message="form.errors.deadline" />
                    </div>
                </div>
                <div class="grid gap-2">
                    <Label for="description">Description:</Label>
                    <Textarea class="field-sizing-content" required :tabindex="3" v-model="form.description" />
                    <InputError class="mt-2" :message="form.errors.description" />
                </div>

                <div class="grid gap-2">
                    <Label for="script_text">Script:</Label>
                    <Textarea class="field-sizing-content" required :tabindex="4" v-model="form.script_text" />
                    <InputError class="mt-2" :message="form.errors.script_text" />
                </div>

                <Button :disabled="form.processing">Save</Button>
            </form>
        </div>
    </AppLayout>
</template>
