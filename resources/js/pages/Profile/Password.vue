<script setup lang="ts">
import { Head} from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import ProfileSubMenu from '@/pages/Profile/ProfileSubMenu.vue';
import UpdatePasswordForm from '@/components/UpdatePasswordForm.vue';
</script>

<template>
    <Head title="SideMenu"> </Head>
    <SiteLayout>
        <ProfileSubMenu sub_page="password">
            <div class="flex flex-col gap-8 max-w-xl">
                <UpdatePasswordForm/>
            </div>
        </ProfileSubMenu>
    </SiteLayout>
</template>
