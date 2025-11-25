<script setup lang="ts">
import { useLocale } from '@/composables/useLocale';

const {T} = useLocale();

</script>

<template>
    <div class="border bg-accent text-gold-500 rounded-md p-4 text-center">
        {{T('in_development')}}
    </div>
</template>

<style scoped></style>
