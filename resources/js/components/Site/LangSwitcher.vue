<script setup lang="ts">
import { ref } from 'vue';
import { usePage } from '@inertiajs/vue3';

const page = usePage();

const locale = ref(page.props.locale);

const setLocale = (locale:string) => {
    const segments = page.url.split('/');
    segments[1] = locale;
    return segments.join('/');
};
</script>

<template>
    <a :href="setLocale('en')" class="text-gray-400 transition duration-500 ease-in-out hover:text-white" v-if="locale==='bg'">
        <img src="/img/flags/en.svg" class="w-5 rounded" alt="english" /></a>
    <a :href="setLocale('bg')" class="text-gray-400 transition duration-500 ease-in-out hover:text-white" v-else>
        <img src="/img/flags/bg.svg" class="w-5 rounded" alt="bulgarian" /></a>
</template>

<style scoped>

</style>
