<script setup lang="ts">
import { computed } from 'vue';
import { Head } from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import { useAppearance } from '@/composables/useAppearance';

const props = defineProps({ status: Number });

const title = computed(() => {
    return {
        503: '503: Service Unavailable',
        500: '500: Server Error',
        404: '404: Page Not Found',
        403: '403: Forbidden',
    }[props.status];
});

const description = computed(() => {
    return {
        503: 'Sorry, we are doing some maintenance. Please check back soon.',
        500: 'Whoops, something went wrong on our servers.',
        404: 'Sorry, the page you are looking for could not be found.',
        403: 'Sorry, you are forbidden from accessing this page.',
    }[props.status];
});

const { isDark } = useAppearance();

</script>

<template>
    <Head title="Welcome"> </Head>
    <SiteLayout :simple="true">
        <div class="container mx-auto mt-10 px-8 text-center space-y-4">
            <img
                v-if="props.status === 503"
                class="w-64 mx-auto"
                :src="isDark() ? '/img/logo_type_on_dark.svg' : '/img/logo_type_on_light.svg'"
                alt="VoiceBank"
            />
            <div>
                <h1 class="text-xl font-bold">{{ title }}</h1>
                <div class="text-sm">{{ description }}</div>
            </div>
        </div>
    </SiteLayout>
</template>
