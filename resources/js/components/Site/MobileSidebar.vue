<script setup lang="ts">
import NavFooter from '@/components/NavFooter.vue';
import NavMain from '@/components/NavMain.vue';
import NavUser from '@/components/NavUser.vue';
import { Sidebar, SidebarContent, SidebarFooter, SidebarHeader, SidebarMenu, SidebarMenuButton, SidebarMenuItem } from '@/components/ui/sidebar';
import { type NavItem } from '@/types';
import { Link, usePage } from '@inertiajs/vue3';
import { BookOpen, Folder } from 'lucide-vue-next';
import AppLogo from './AppLogo.vue';
import Appearance from '@/pages/settings/Appearance.vue';
import AppearanceTabs from '@/components/AppearanceTabs.vue';

const items: NavItem[] = usePage().props.menu as NavItem[];

// const footerNavItems: NavItem[] = [
//     {
//         title: import.meta.env.VITE_APP_NAME || 'Voice Bank',
//         href: import.meta.env.VITE_APP_URL || 'https://lap.test',
//
//     }
// ];
</script>

<template>
    <Sidebar variant="inset">
        <!--        <SidebarHeader>-->
        <!--            <SidebarMenu>-->
        <!--                <SidebarMenuItem>-->
        <!--                    <SidebarMenuButton size="lg" as-child>-->
        <!--                        <Link :href="dashboard.url()">-->
        <!--                            <AppLogo />-->
        <!--                        </Link>-->
        <!--                    </SidebarMenuButton>-->
        <!--                </SidebarMenuItem>-->
        <!--            </SidebarMenu>-->
        <!--        </SidebarHeader>-->

        <SidebarContent class="py-8">
            <NavMain :items="items" />
        </SidebarContent>

        <SidebarFooter>
            <!--            <NavFooter :items="footerNavItems" />-->
            <!--            <NavUser />-->
            <AppearanceTabs></AppearanceTabs>
        </SidebarFooter>
    </Sidebar>
    <slot />
</template>
