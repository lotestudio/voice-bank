<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, usePage } from '@inertiajs/vue3';
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar';

const user = usePage().props.user;
</script>

<template>
    <AppLayout :breadcrumbs="[]">
        <Head title="Show" />
        <div class="flex gap-2 p-4">
            <div class="w-[250px]">
                <Avatar class="flex aspect-square w-full h-auto cursor-pointer items-center justify-center bg-sidebar-accent">
                    <AvatarImage :src="user.avatar.url" :alt="user.avatar.initials" />
                    <AvatarFallback class="text-xs font-bold">{{ user.avatar.initials }}</AvatarFallback>
                </Avatar>



            </div>
            <div class="flex-1">
                {{ user.name }}
            </div>
        </div>
    </AppLayout>
</template>
