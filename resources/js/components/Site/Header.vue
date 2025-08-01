<script setup lang="ts">
import { SidebarTrigger, useSidebar } from '@/components/ui/sidebar';
import { Link, usePage } from '@inertiajs/vue3';
import type { NavItem, SharedData } from '@/types';
import LangSwitcher from '@/components/Site/LangSwitcher.vue';
const { isMobile } = useSidebar();
const items: NavItem[] = usePage().props.menu as NavItem[];


const page = usePage<SharedData>();
const base_url = import.meta.env.VITE_APP_URL || 'https://voice.test';
const page_url = base_url+page.url;


</script>
<template>
    <header
        class="flex h-16 shrink-0 items-center gap-2 border-b border-sidebar-border/70 px-6 transition-[width,height] ease-linear group-has-data-[collapsible=icon]/sidebar-wrapper:h-12 md:px-4"
    >
        <div class="flex items-center gap-2">
            <SidebarTrigger class="-ml-1" v-if="isMobile" />
            <div v-else>Voice Bank</div>
        </div>
        <div class="flex flex-1 justify-center md:justify-end">
            <div v-if="isMobile">Voice Bank</div>
            <div v-else class="flex items-center gap-3">
                <Link :key="index" :href="item.href" v-for="(item,index) in items"
                   :class="item.href === page_url ? 'opacity-100' : 'opacity-50 hover:opacity-100'"

                >{{item.title}}</Link>
                <LangSwitcher/>
            </div>
        </div>
        <div class="flex items-center gap-2" v-if="isMobile">
            <LangSwitcher/>
        </div>
    </header>
</template>
