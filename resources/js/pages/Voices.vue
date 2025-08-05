<script setup lang="ts">
import { Head, usePage } from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import { useLocale } from '@/composables/useLocale';
import VoiceGrid from '@/components/Site/VoiceGrid.vue';

const page = usePage();
const locale = page.props.locale;
const { T } = useLocale()
</script>

<template>
    <Head title="Welcome">
    </Head>
    <SiteLayout>
        <div class="container mx-auto mt-10 px-8">
            <h1 class="mb-1 font-bold text-3xl">{{T('voices',locale)}}</h1>
            <h2 class="mb-1 font-bold text-xl">Voice Bank</h2>
            <p class="text-sm">{{ T('The site is under construction!',locale) }}</p>
            <VoiceGrid :data="page.props.voices"></VoiceGrid>
        </div>
    </SiteLayout>
</template>
