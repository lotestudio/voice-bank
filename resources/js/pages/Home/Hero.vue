<script setup lang="ts">
import { Button } from '@/components/ui/button';
import { useLocale } from '@/composables/useLocale';
defineProps({
    content: Object,
});

const { T } = useLocale();
</script>

<template>
    <div class="container mx-auto mt-10 px-8">
        <h1 class="mx-auto mb-1 max-w-4xl text-center text-2xl font-bold text-balance md:text-xl lg:text-3xl" v-html="content.title"></h1>
        <h2 class="mx-auto my-8 max-w-2xl text-center text-balance md:text-lg lg:text-2xl">{{ content.excerpt }}</h2>
        <div class="mx-auto flex max-w-2xl justify-center gap-4">
            <Button variant="default" size="lg">{{ T('order') }}</Button>
            <Button variant="secondary" size="lg">{{T('become an artist')}}</Button>
        </div>
    </div>
</template>
