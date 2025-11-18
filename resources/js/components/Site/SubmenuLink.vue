<script setup lang="ts">
import { Link } from '@inertiajs/vue3';
import { useLocale } from '@/composables/useLocale';

const { T } = useLocale();

const props=defineProps({
    title: {
        type: String,
        required: true,
    },
    href: {
        type: String,
        required: true,
    }
});



// Full current URL path (e.g. "/users/1?tab=profile")
const active = window.location.href===props.href;

</script>
<template>

    <Link as="button" :href="href" :class="active ? 'bg-muted' : ''" class="block w-full hover:bg-muted px-2 py-1.5 rounded text-left">
        {{ T(title) }}
    </Link>

</template>

<style scoped></style>
