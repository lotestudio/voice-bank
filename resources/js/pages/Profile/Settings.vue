<script setup lang="ts">
import { Head} from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import ProfileSubMenu from '@/pages/Profile/ProfileSubMenu.vue';
import { useAuth } from '@/composables/useAuth';
import AppearanceTabs from '@/components/AppearanceTabs.vue';


const {user,role} = useAuth();

</script>

<template>
    <Head title="SideMenu"> </Head>
    <SiteLayout>
        <ProfileSubMenu sub_page="settings">

            <div class="space-y-6">
                <div>
                    <div>Name: {{user.name}}</div>
                    <div>Role: {{role}}</div>
                </div>
                <AppearanceTabs></AppearanceTabs>
            </div>



        </ProfileSubMenu>
    </SiteLayout>
</template>
