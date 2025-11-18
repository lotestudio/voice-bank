<script setup lang="ts">
import { SidebarTrigger, useSidebar } from '@/components/ui/sidebar';
import { Link, usePage } from '@inertiajs/vue3';
import type { NavItem } from '@/types';
import LangSwitcher from '@/components/Site/LangSwitcher.vue';
import { useActive } from '@/composables/useActive';
import Logo from '@/components/Site/Logo.vue';

const items: NavItem[] = usePage().props.menu as NavItem[];
const { isMobile } = useSidebar();
const { isActive } = useActive();

</script>
<template>
    <header
        class="flex h-16 shrink-0 items-center gap-2 border-b border-sidebar-border/70 px-6 transition-[width,height] ease-linear group-has-data-[collapsible=icon]/sidebar-wrapper:h-12 md:px-4"
    >
        <div class="flex items-center gap-2">
            <SidebarTrigger class="-ml-1" v-if="isMobile" />
            <div v-else>
                <Link href="/">
                    <Logo/>
                </Link>
            </div>
        </div>
        <div class="flex flex-1 justify-center md:justify-end">
            <div v-if="isMobile">
                <Link href="/">
                    <Logo width="120px"/>
                </Link>
            </div>
            <div v-else class="flex items-center gap-3">
                <Link
                    :key="index"
                    :href="item.href"
                    v-for="(item, index) in items"
                    :class="isActive(item.href) ? 'opacity-100' : 'opacity-50 hover:opacity-100'"
                    >
                    <span v-if="item.icon" class="i" :class="item.icon"></span>
                    <span v-else>{{ item.title }}</span>
                </Link
                >
                <LangSwitcher />
            </div>
        </div>
        <div class="flex items-center gap-2" v-if="isMobile">
            <LangSwitcher />
        </div>
    </header>
</template>
