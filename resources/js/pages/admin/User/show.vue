<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, usePage } from '@inertiajs/vue3';
const user = usePage().props.user;
</script>

<template>
    <AppLayout :breadcrumbs="[]">
        <Head title="Show" />
        <div class="p-4">
            {{ user.name }}
        </div>
    </AppLayout>
</template>
