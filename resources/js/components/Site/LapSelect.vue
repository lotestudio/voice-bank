<template>
    <div class="dropdown inline-block relative">
        <div @click="isOpen=!isOpen">
            <button class="btn focus:outline-none">
                <span class="mr-1">{{ selected }}</span>
                <svg class="fill-current h-4 w-4" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
                    <path d="M9.293 12.95l.707.707L15.657 8l-1.414-1.414L10 10.828 5.757 6.586 4.343 8z"/>
                </svg>
            </button>
        </div>

        <div v-show="isOpen" class="fixed inset-0 z-40" @click="isOpen=false"></div>

        <div class="absolute text-white mt-1 z-50 overflow-y-auto rounded py-2 px-6 bg-gray-700" style="max-height: 250px;" :class="isOpen ? 'block' : 'hidden'">
            <ul @click="isOpen=false" class="dropdown-menu">
                <slot></slot>
            </ul>
        </div>
    </div>

</template>

<script setup>


import { ref } from 'vue';

defineProps({
    selected: {
        type: String,
        default: 'Choose'
    }
})

const isOpen = ref(false);
</script>

<style scoped>

    @reference "@@/app.css";

    .dropdown-menu li a{
        @apply bg-gray-900 hover:bg-gray-700 py-2 px-4 block whitespace-nowrap
    }

    .dropdown-menu li:first-child a{
        @apply rounded-t
    }
    .dropdown-menu li:last-child a{
        @apply rounded-b
    }
</style>
