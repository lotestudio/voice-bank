<script setup lang="ts">
import { Head, usePage } from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import ProfileSubMenu from '@/pages/Profile/ProfileSubMenu.vue';
import HeadingSmall from '@/components/HeadingSmall.vue';
import AvatarUpload from '@/components/AvatarUpload.vue';
import { useAuth } from '@/composables/useAuth';

const { user } = useAuth();

const page = usePage();
const title = page.props.heading?.title;
const description = page.props.heading?.description;
</script>

<template>
    <Head title="SideMenu"> </Head>
    <SiteLayout>
        <ProfileSubMenu sub_page="avatar">
            <div class="flex max-w-xl flex-col gap-8">
                <div class="space-y-6">
                    <HeadingSmall :title="title" :description="description" />
                    <div class="max-w-xs">
                        <AvatarUpload :fallback_text="user.avatar.initials" :avatar_url="user.avatar.url" show_remove_button />
                    </div>
                </div>
            </div>
        </ProfileSubMenu>
    </SiteLayout>
</template>
