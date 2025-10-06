<script setup lang="ts">
import AppLayout from '@/layouts/SiteLayout.vue';
import { Head, usePage, router} from '@inertiajs/vue3';
import { Button } from '@/components/ui/button';

const artist = usePage().props.artist;

function goBack() {
    if (window.history.length > 1) {
        window.history.back()
    } else {
        router.visit('/') // change to the route you want as fallback
    }
}

</script>

<template>
    <AppLayout>
        <Head title="Artist Profile" />
        <div class="container mx-auto mt-10 px-8">
            <div class="flex justify-between items-center">
                <h1 class="mb-1 text-3xl font-bold">{{ artist.name }}</h1>
                <Button variant="ghost" size="icon" class="rounded-full border px-2 py-1" @click="goBack()"><span class="text-2xl i-chevronLeft"></span></Button>
            </div>
            <main class="mt-8 max-w-[65ch] space-y-4">
                ---
            </main>
        </div>
    </AppLayout>
</template>
