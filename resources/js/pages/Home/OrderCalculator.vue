<script setup lang="ts">
import VoiceGrid from '@/components/Site/VoiceGrid.vue';
import { Link, usePage } from '@inertiajs/vue3';
import { Button } from '@/components/ui/button';
import { ref } from 'vue';
const page = usePage();
const locale = ref(page.props.locale);
</script>

<template>

    <div class="container mx-auto mt-10 px-8 space-y-10">
        <div class="max-w-2xl mx-auto">
            <h2 class="mb-1 font-bold text-3xl tracking-tighter text-center">Изчисли стойността на поръчката</h2>
            <p class="text-center text-balance">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam harum magni porro repudiandae similique. Autem cumque, doloremque provident sequi tenetur voluptate voluptatem? Eos excepturi facilis iste nobis quia sint soluta.</p>
        </div>
    </div>
</template>
