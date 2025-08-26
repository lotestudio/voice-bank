<script setup lang="ts">
    defineProps({
        width:{
            type:String,
            default:'150px'
        }
    })
</script>

<template>
    <div>
        <img src="/img/logo_type_on_dark.svg" alt="Voice Bank" class="hidden dark:block" :style="{'width': width}">
        <img src="/img/logo_type_on_light.svg" alt="Voice Bank" class="block dark:hidden" :style="{'width': width}">
    </div>
</template>

<style scoped></style>
