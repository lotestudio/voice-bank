<script setup lang="ts">
import { Head } from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import ProfileSubMenu from '@/pages/Profile/ProfileSubMenu.vue';
import InDevelopment from '@/components/Site/InDevelopment.vue';

</script>

<template>
    <Head title="SideMenu">
    </Head>
    <SiteLayout>
        <ProfileSubMenu sub_page="favorites">
            <InDevelopment class="my-4"/>
        </ProfileSubMenu>
    </SiteLayout>
</template>
