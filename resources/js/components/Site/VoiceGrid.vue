<script setup lang="ts">
    import Voice from '@/components/Site/Voice.vue';

    defineProps({
       data:{
           type:Object,
           required:true,
       }
    });

</script>

<template>
    <div class="grid grid-cols-1 gap-4 md:grid-cols-2 xl:grid-cols-3">
        <Voice v-for="voice in data?.data" :key="voice.id" :voice="voice" />
    </div>
</template>

<style scoped>

</style>
