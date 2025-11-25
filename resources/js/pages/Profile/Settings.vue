<script setup lang="ts">
import { Head} from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import ProfileSubMenu from '@/pages/Profile/ProfileSubMenu.vue';
//import { useAuth } from '@/composables/useAuth';
import AppearanceTabs from '@/components/AppearanceTabs.vue';
import ProfileForm from '@/components/ProfileForm.vue';
import DeleteUser from '@/components/DeleteUser.vue';
import UpdatePasswordForm from '@/components/UpdatePasswordForm.vue';
import HeadingSmall from '@/components/HeadingSmall.vue';



// const {user,role} = useAuth();

</script>

<template>
    <Head title="SideMenu"> </Head>
    <SiteLayout>
        <ProfileSubMenu sub_page="settings">
            <div class="flex flex-col gap-8 max-w-xl">
                <ProfileForm :must-verify-email="false"/>
                <hr>
                <UpdatePasswordForm/>
                <hr>
                <DeleteUser/>
                <div class="space-y-6">
                    <HeadingSmall title="Appearance" description="Choose your color theme" />
                    <AppearanceTabs/>
                </div>
            </div>
        </ProfileSubMenu>
    </SiteLayout>
</template>
