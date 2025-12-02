<script setup lang="ts">
import { useAppearance } from '@/composables/useAppearance';
import SiteLayout from '@/layouts/SiteLayout.vue';
import { Head, Link, router } from '@inertiajs/vue3';
import { computed } from 'vue';

const props = defineProps<{ status: number }>();

const mapTitle: Record<number, string> = {
    503: 'Service Unavailable',
    500: 'Server Error',
    404: 'Page Not Found',
    403: 'Forbidden',
    419: 'Page Expired',
};

const mapDescription: Record<number, string> = {
    503: 'Sorry, we are doing some maintenance. Please check back soon.',
    500: 'Whoops, something went wrong on our servers.',
    404: 'Sorry, the page you are looking for could not be found.',
    403: 'Sorry, you are forbidden from accessing this page.',
    419: 'Your session has expired. Please refresh and try again.',
};

const title = computed(() => `${props.status} ${mapTitle[props.status] ?? 'Error'}`);
const description = computed(() => mapDescription[props.status] ?? 'An unexpected error has occurred.');

const { isDark } = useAppearance();

function goBack() {
    if (document.referrer) {
        router.visit(document.referrer, { preserveScroll: true, preserveState: true, replace: true });
    } else {
        router.visit('/', { replace: true });
    }
}
</script>

<template>
    <Head :title="title" />
    <SiteLayout :simple="true">
        <div class="container mx-auto mt-12 px-6 text-center">
            <img
                v-if="props.status === 503"
                class="mx-auto w-48"
                :src="isDark() ? '/img/logo_type_on_dark.svg' : '/img/logo_type_on_light.svg'"
                alt="VoiceBank"
            />

            <div class="mt-6">
                <h1 class="text-2xl font-semibold tracking-tight">{{ title }}</h1>
                <p class="mt-2 text-sm text-muted-foreground">{{ description }}</p>
            </div>

            <div class="mt-8 flex items-center justify-center gap-3">
                <Button variant="outline" @click="goBack"> Go back </Button>

                <Button variant="outline" as-child>
                    <Link href="/"> Go to homepage </Link>
                </Button>
            </div>

            <div v-if="props.status === 419" class="mt-4 text-xs text-gray-500 dark:text-gray-500">
                If the problem persists, try signing in again.
            </div>
        </div>
    </SiteLayout>
</template>
