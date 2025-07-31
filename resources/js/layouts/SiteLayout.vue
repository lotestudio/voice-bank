<template>
<SiteShell>
    <MobileSidebar />
    <Header/>
    <main class="mx-auto flex h-full w-full max-w-7xl flex-1 flex-col gap-4 rounded-xl">
        <slot />
    </main>
    <footer class="sticky bg-transparent p-4" style="top:100vh;top:100dvh;">
        <p class="text-center text-xs text-gray-400">Voice Bank {{ new Date().getFullYear() }}</p>
    </footer>
</SiteShell>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue';
import {Link, usePage } from '@inertiajs/vue3';
import { useLocale } from '@/composables/useLocale.js';
import SiteShell from '@/components/Site/SiteShell.vue';
import MobileSidebar from '@/components/Site/MobileSidebar.vue';
import Header from '@/components/Site/Header.vue';

const page = usePage();

const locale = ref(page.props.locale);

const contentTrigger = ref(false);

const { T } = useLocale()

onMounted(() => {
    contentTrigger.value = true;
});

</script>
