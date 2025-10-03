<script setup lang="ts">
import VoiceGrid from '@/components/Site/VoiceGrid.vue';
import { Link, usePage } from '@inertiajs/vue3';
import { Button } from '@/components/ui/button';
import { ref } from 'vue';
const page = usePage();
const locale = ref(page.props.locale);
const content=page.props.contents['home.featured_voices'];
</script>

<template>
    <section class="bg-white dark:linear-gradient(to_bottom,white,transparent) dark:bg-primary/10 mt-10 pb-10">
    <div class="container mx-auto mt-10 px-8 space-y-10">
        <div class="max-w-2xl mx-auto">
            <h2 class="mb-1 font-bold text-3xl tracking-tighter text-center">{{content.title}}</h2>
            <p class="text-center text-balance">{{content.excerpt}}</p>
        </div>

        <VoiceGrid :data="page.props.voices"></VoiceGrid>

        <div class="text-center">
            <Button size="lg" as-child>
                <Link :href="locale+ '/voices'">Разгледай всички</Link>
            </Button>
        </div>
    </div>
    </section>
</template>
