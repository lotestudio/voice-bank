<template>
<SiteShell>
    <MobileSidebar v-if="!simple"/>
    <Header v-if="!simple"/>
    <main class="mx-auto flex h-full w-full max-w-7xl flex-1 flex-col gap-4 rounded-xl">
        <slot />
    </main>
    <footer class="sticky bg-transparent p-4" style="top:100vh;top:100dvh;">
        <p class="text-center text-xs text-gray-400">Voice Bank {{ new Date().getFullYear() }}</p>
    </footer>
</SiteShell>
</template>

<script setup lang="ts">
import SiteShell from '@/components/Site/SiteShell.vue';
import MobileSidebar from '@/components/Site/MobileSidebar.vue';
import Header from '@/components/Site/Header.vue';


defineProps({
    simple:{Boolean, default:false}
});


</script>
