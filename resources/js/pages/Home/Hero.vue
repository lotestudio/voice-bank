
<script setup lang="ts">
import { Button } from '@/components/ui/button';
defineProps({
    'content': Object,
})
</script>

<template>
    <div class="container mx-auto mt-10 px-8">
        <h1 class="mb-1 font-bold text-2xl md:text-xl lg:text-3xl text-center text-balance max-w-4xl mx-auto" v-html="content.title"></h1>
        <h2 class="my-8  md:text-lg lg:text-2xl text-center text-balance max-w-2xl mx-auto">{{content.excerpt}}</h2>
        <div class="max-w-2xl mx-auto justify-center flex gap-4">
            <Button variant="default" size="lg">Поръчай</Button>
            <Button variant="secondary" size="lg">Стани диктор</Button>
        </div>

    </div>
</template>
