<script setup lang="ts">
import { Head, usePage } from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';

const page = usePage();
const contents = page.props.privacy;
</script>

<template>
    <Head title="Privacy Policy"> </Head>
    <SiteLayout>
        <div class="container mx-auto mt-10 px-8">
            <h1 class="mb-1 text-3xl font-bold">{{ contents.title }}</h1>
            <main class="mt-8 max-w-[65ch] space-y-4">
                <p v-html="contents.excerpt"></p>
                <article v-html="contents.body"></article>
            </main>
        </div>
    </SiteLayout>
</template>
