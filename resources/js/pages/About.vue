<script setup lang="ts">
import { Head, usePage } from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import { useLocale } from '@/composables/useLocale';

const { T } = useLocale()
const page = usePage();
const contents=page.props.about;
</script>

<template>
    <Head title="About">
    </Head>
    <SiteLayout>
        <div class="container mx-auto mt-10 px-8">
            <h1 class="mb-1 font-bold text-3xl">{{T('about')}}</h1>
            <main class="max-w-[65ch] mt-8 space-y-4">
                <div class="text-lg md:text-2xl leading-tight" v-html="contents.excerpt"></div>
                <article v-html="contents.body"></article>
            </main>
        </div>
    </SiteLayout>
</template>
