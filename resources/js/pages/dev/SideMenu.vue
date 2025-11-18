<script setup lang="ts">
import { Head, usePage } from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import SubMenuLayout from '@/layouts/SubMenuLayout.vue';
const submenu = usePage().props.menu?.profile?.children ?? [];
</script>

<template>
    <Head title="SideMenu">
    </Head>
    <SiteLayout>
        <SubMenuLayout :submenu="submenu" title="Profile">
            ---
        </SubMenuLayout>
    </SiteLayout>
</template>
