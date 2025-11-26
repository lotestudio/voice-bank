<script setup lang="ts">
import { Head, usePage } from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import ProfileSubMenu from '@/pages/Profile/ProfileSubMenu.vue';
import AppearanceTabs from '@/components/AppearanceTabs.vue';
import HeadingSmall from '@/components/HeadingSmall.vue';

const page = usePage();
const title = page.props.heading?.title;
const description = page.props.heading?.description;
</script>

<template>
    <Head title="SideMenu"> </Head>
    <SiteLayout>
        <ProfileSubMenu sub_page="appearance">
            <div class="flex max-w-xl flex-col gap-8">
                <div class="space-y-6">
                    <HeadingSmall :title="title" :description="description" />
                    <AppearanceTabs />
                </div>
            </div>
        </ProfileSubMenu>
    </SiteLayout>
</template>
