<script setup lang="ts">
import NavMain from '@/components/NavMain.vue';
import {
    Sidebar,
    SidebarContent,
    SidebarFooter,
    useSidebar
} from '@/components/ui/sidebar';
import { type NavItem } from '@/types';
import { usePage } from '@inertiajs/vue3';
import AppearanceTabs from '@/components/AppearanceTabs.vue';

const items: NavItem[] = usePage().props.menu as NavItem[];
const {isMobile} = useSidebar();

</script>

<template>
    <Sidebar variant="inset" v-if="isMobile">
        <SidebarContent class="py-8">
            <NavMain :items="items" />
        </SidebarContent>
        <SidebarFooter>
            <AppearanceTabs></AppearanceTabs>
        </SidebarFooter>
    </Sidebar>
    <slot />
</template>
