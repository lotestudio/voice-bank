<template>
    <div class="container mx-auto mt-10 px-8">
        <div class="md:flex md:gap-8">
            <div class="w-[250px] hidden md:flex flex-col gap-1 pt-12">
                <slot name="sub_sidebar_header"/>
                <SubmenuLink
                    v-for="item in submenu"
                    :title="item.title"
                    :href="item.href"
                    :key="item.title"
                />
                <slot name="sub_sidebar_footer"/>
            </div>
            <div class="flex-1">
                <h1 class="font-bold text-3xl mt-2" v-if="title!==''">{{title}}</h1>
                <slot/>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import SubmenuLink from '@/components/Site/SubmenuLink.vue';


defineProps({
    submenu:{Array, required:true},
    title:{String,default:''}
});


</script>
