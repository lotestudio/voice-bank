<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, usePage } from '@inertiajs/vue3';
import AvatarUpload from '@/components/AvatarUpload.vue';
const user = usePage().props.user;
</script>

<template>
    <AppLayout :breadcrumbs="[]">
        <Head title="Show" />
        <div class="flex gap-2 p-4">
            <div class="w-[250px]">
            <AvatarUpload
                :fallback_text="user.avatar.initials"
                :avatar_url="user.avatar.url"
                :post_data="{user_id: user.id}"
                show_remove_button
            />
            </div>
            <div class="flex-1">
                {{ user.name }}
            </div>
        </div>
    </AppLayout>
</template>
