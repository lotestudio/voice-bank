<script setup lang="ts">

import { onMounted } from 'vue';
import InDevelopment from '@/components/Site/InDevelopment.vue';

const props=defineProps<{voice:any}>()

onMounted(()=>{
    if(props.voice){
        console.log('voice is here')
    }else{
        console.log("no voice: load")
    }
});
</script>
<template>
    <div>
        <InDevelopment/>
    </div>
</template>

<style scoped></style>
