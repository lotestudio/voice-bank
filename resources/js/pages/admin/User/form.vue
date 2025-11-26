<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, useForm, usePage } from '@inertiajs/vue3';
import { Label } from '@/components/ui/label';
import LoteSelect from '@/components/LoteSelect.vue';

const page = usePage();
const isEdit = !!page.props.model;
const form = useForm({
    name: page.props.model?.name ?? '',
    email: page.props.model?.email ?? '',
    role: page.props.model?.role ?? '',
    password: '',
    password_confirmation: '',
});

function submit() {
    if (isEdit) {
        form.put('/admin/user/' + page.props.model.id);
    } else {
        form.post('/admin/user');
    }
}
</script>

<template>
    <AppLayout :breadcrumbs="[]">
        <Head :title="isEdit ? 'Edit User' : 'Create User'" />
        <div class="max-w-xl p-4">
            <form @submit.prevent="submit" class="space-y-6">
                <div class="grid gap-2">
                    <Label for="name">Name:</Label>
                    <Input id="name"
                           required
                           :tabindex="2"
                           v-model="form.name"
                    />
                <InputError class="mt-2" :message="form.errors.name" />
                </div>
                <div class="grid gap-2">
                    <Label for="email">Email address</Label>
                    <Input
                        id="email"
                        type="email"
                        required
                        :tabindex="2"
                        v-model="form.email"
                        placeholder="email@example.com"
                    />
                    <InputError :message="form.errors.email" />
                </div>

                <div class="grid gap-2">
                    <Label for="name">Role</Label>
                    <LoteSelect
                        :options="[
                                { label: 'Choose', value: '' },
                                { label: 'Artist', value: 'artist' },
                                { label: 'Client', value: 'client' },
                            ]"
                        :selected="form.role || ''"
                        name="role"
                        width_class="w-full"
                    />
                    <InputError :message="form.errors.role" />
                </div>

                <div class="grid gap-2">
                    <Label for="password">Password</Label>
                    <Input
                        id="password"
                        type="password"
                        :tabindex="3"
                        autocomplete="new-password"
                        v-model="form.password"
                        placeholder="Password"
                    />
                    <InputError :message="form.errors.password" />
                </div>

                <div class="grid gap-2">
                    <Label for="password_confirmation">Confirm password</Label>
                    <Input
                        id="password_confirmation"
                        type="password"
                        :tabindex="4"
                        autocomplete="new-password"
                        v-model="form.password_confirmation"
                        placeholder="Confirm password"
                    />
                    <InputError :message="form.errors.password_confirmation" />
                </div>

                <Button :disabled="form.processing">Save</Button>
            </form>
        </div>
    </AppLayout>
</template>
