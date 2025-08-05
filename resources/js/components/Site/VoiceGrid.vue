<script setup lang="ts">
    import Voice from '@/components/Site/Voice.vue';

    const props=defineProps({
       data:Object
    });
</script>

<template>

    <div>
        <Voice v-for="voice in data?.data" :key="voice.id" :voice="voice" />

        <div>
            {{data.total}}
        </div>
    </div>


</template>

<style scoped>

</style>
