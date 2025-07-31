<template>
    <div>
        <div class="w-full flex items-center justify-center p-20 text-center" v-if="loading">

            <svg style="height:40px; display: block" fill="currentColor" class="animate-spin" xmlns="http://www.w3.org/2000/svg"
                 xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                 viewBox="0 0 40 40" xml:space="preserve">
	                        <path class="opacity-50" d="M28.5,3.6v1.1c5.4,3,9,8.7,9,15.3c0,9.6-7.8,17.5-17.5,17.5S2.5,29.6,2.5,20c0-6.6,3.6-12.3,9-15.3V3.6
	c-5.9,3.1-10,9.3-10,16.4c0,10.2,8.3,18.5,18.5,18.5S38.5,30.2,38.5,20C38.5,12.9,34.4,6.7,28.5,3.6z"/>
                <path
                    d="M28.5,3.6v1.1C26,3.3,23.1,2.5,20,2.5s-6,0.8-8.5,2.2V3.6C14,2.2,16.9,1.5,20,1.5S26,2.2,28.5,3.6z"/>
                        </svg>
        </div>
        <div v-else v-html="src"></div>
    </div>
</template>

<script setup>

import { onMounted, ref } from 'vue';
import axios from 'axios';

const props = defineProps({
    url:{
        type:String,
        required:true,
    }
})


const src = ref();
const loading= ref(true);

onMounted(()=>{
    axios.get(props.url).then((response)=>{
        src.value=response.data;
        loading.value=false
    })
})
</script>

<style scoped>

</style>
