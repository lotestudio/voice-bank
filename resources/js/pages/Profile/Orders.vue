<script setup lang="ts">
import { Head } from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import ProfileSubMenu from '@/pages/Profile/ProfileSubMenu.vue';
import UserOrder from '@/components/Site/UserOrder.vue';

</script>

<template>
    <Head title="SideMenu">
    </Head>
    <SiteLayout>
        <ProfileSubMenu sub_page="orders">
            <div class="grid grid-cols-1 gap-4 lg:grid-cols-2 xl:grid-cols-3 mt-4 w-full">
            <user-order :order="order" v-for="order in $page.props.orders.data" :key="order.id"></user-order>
            </div>
        </ProfileSubMenu>
    </SiteLayout>
</template>
