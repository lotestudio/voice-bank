<script setup lang="ts">
defineProps({
    'content': Object,
})

</script>

<template>

        <div class="container mx-auto mt-10 px-8 space-y-10">
            <div class="max-w-2xl mx-auto">
                <h2 class="mb-1 font-bold text-3xl tracking-tighter text-center">
                    {{content.title}}
                </h2>
                <p class="text-center text-balance">
                    {{content.excerpt}}
                </p>
            </div>
        </div>

</template>
