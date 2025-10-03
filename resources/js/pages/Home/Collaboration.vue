<script setup lang="ts">
defineProps({
    'content': Object,
})

</script>

<template>
    <section class="bg-white dark:linear-gradient(to_bottom,white,transparent) dark:bg-primary/10 mt-10 pb-10">
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
    </section>
</template>
