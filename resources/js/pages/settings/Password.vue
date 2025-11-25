<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import SettingsLayout from '@/layouts/settings/Layout.vue';
import { Head} from '@inertiajs/vue3';
import { type BreadcrumbItem } from '@/types';
import UpdatePasswordForm from '@/components/UpdatePasswordForm.vue';

const breadcrumbItems: BreadcrumbItem[] = [
    {
        title: 'Password settings',
        href: '/settings/password',
    },
];

</script>

<template>
    <AppLayout :breadcrumbs="breadcrumbItems">
        <Head title="Password settings" />
        <SettingsLayout>
            <UpdatePasswordForm/>
        </SettingsLayout>
    </AppLayout>
</template>
