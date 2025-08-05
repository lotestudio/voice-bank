<script setup lang="ts">
import { usePage } from '@inertiajs/vue3';

const props=defineProps({
    voice:Object
});

</script>

<template>
    <div>
        {{ voice?.title }}
    </div>
</template>

<style scoped>

</style>
