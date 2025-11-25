<template>
    <SiteShell>
        <MobileSidebar v-if="!simple" />
        <Header v-if="!simple" />
        <main class="mx-auto flex h-full w-full flex-1 flex-col gap-4 rounded-xl">
            <slot />
        </main>
        <footer class="sticky mt-10 bg-gold-400 p-4 text-gold-50" style="top: 100vh; top: 100dvh">
            <p class="text-center text-xs">Voice Bank {{ new Date().getFullYear() }}</p>
        </footer>
        <Toaster />

        <LoteAlertDialog
            :auto-open="!!$page.props.flash.modal"
            close-only
            confirm-label="Ok"
            confirm-variant="default"
            :dialog-description="$page.props.flash.modal?.description"
            :dialog-title="$page.props.flash.modal?.title"
        />
    </SiteShell>
</template>

<script setup lang="ts">
import SiteShell from '@/components/Site/SiteShell.vue';
import MobileSidebar from '@/components/Site/MobileSidebar.vue';
import Header from '@/components/Site/Header.vue';
import { Toaster } from '@/components/ui/sonner';
import 'vue-sonner/style.css';
import LoteAlertDialog from '@/components/LoteAlertDialog.vue';
import { usePage } from '@inertiajs/vue3';
import { useGlobalCart } from '@/cartStore'; // vue-sonner v2 requires this import

defineProps({
    simple: { Boolean, default: false },
});

if(usePage().props.flash.clear_cart){
    useGlobalCart().clearOrder()
}


</script>
