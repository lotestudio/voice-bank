<script setup lang="ts">
import NavFooter from '@/components/NavFooter.vue';
import NavMain from '@/components/NavMain.vue';
import NavUser from '@/components/NavUser.vue';
import { Sidebar, SidebarContent, SidebarFooter, SidebarHeader, SidebarMenu, SidebarMenuButton, SidebarMenuItem } from '@/components/ui/sidebar';
import { type NavItem } from '@/types';
import { Link } from '@inertiajs/vue3';
import { BookOpen, Folder } from 'lucide-vue-next';
import AppLogo from './AppLogo.vue';
import { dashboard } from '@/routes';

const items: NavItem[] = [
    {
        title: 'Posts',
        href: '/admin/post',
        icon: Folder,
    }, {
        title: 'Voices',
        href: '/admin/voice',
        icon: Folder,
    },
    {
        title: 'Features',
        href: '/admin/feature',
        icon: Folder,
    },
    {
        title: 'Feature Values',
        href: '/admin/feature-value',
        icon: Folder,
    },
    {
        title: 'Samples',
        href: '/admin/sample',
        icon: Folder,
    },{
        title: 'Reviews',
        href: '/admin/review',
        icon: Folder,
    },{
        title: 'Orders',
        href: '/admin/order',
        icon: Folder,
    },{
        title: 'Payments',
        href: '/admin/payment',
        icon: Folder,
    },
    {
        title: 'Users',
        href: '/admin/user',
        icon: BookOpen,
    }
];



const footerNavItems: NavItem[] = [
    {
        title: import.meta.env.VITE_APP_NAME || 'Voice Bank',
        href: '/',
        icon: Folder,
    }
];
</script>

<template>
    <Sidebar collapsible="icon" variant="inset">
        <SidebarHeader>
            <SidebarMenu>
                <SidebarMenuItem>
                    <SidebarMenuButton size="lg" as-child>
                        <Link :href="dashboard.url()">
                            <AppLogo />
                        </Link>
                    </SidebarMenuButton>
                </SidebarMenuItem>
            </SidebarMenu>
        </SidebarHeader>

        <SidebarContent>
            <NavMain :items="items"/>
        </SidebarContent>

        <SidebarFooter>
            <NavFooter :items="footerNavItems" />
            <NavUser />
        </SidebarFooter>
    </Sidebar>
    <slot />
</template>
