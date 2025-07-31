<template>
    <div class="pb-16">
        <section class="relative">

        </section>
        <section class="relative z-20">
            <transition name="fade">
                <div>
                    <slot></slot>
                </div>
            </transition>
            <footer class="container mx-auto mt-20 bg-transparent p-4">
                <p class="text-center text-xs text-gray-400">Voice Bank {{ new Date().getFullYear() }}</p>
            </footer>
        </section>
    </div>
</template>

<script setup lang="ts">
import { onMounted, ref } from 'vue';
import {Link, usePage } from '@inertiajs/vue3';
import { useLocale } from '@/composables/useLocale.js';

const page = usePage();

const locale = ref(page.props.locale);

const contentTrigger = ref(false);

const setLocale = (locale) => {
    const segments = page.url.split('/');
    segments[1] = locale;
    return segments.join('/');
};
const isActive = (href) => {
    return href === page.url;
};

const { T } = useLocale()

onMounted(() => {
    contentTrigger.value = true;
});

</script>

<style scoped>
@reference "@@/app.css";

.nav-link {
    @apply mr-4 text-white/70 transition duration-300 ease-in-out hover:text-white;
}

.nav-link.active {
    @apply border-b border-b-white text-white;
}

/* durations and timing functions.*/
.fade-enter-active {
    transition: opacity 0.5s ease;
}

.fade-leave-active {
    transition: all 0.8s cubic-bezier(1, 0.5, 0.8, 1);
}

.fade-enter, .slide-fade-leave-to
    /* .slide-fade-leave-active below version 2.1.8 */ {
    opacity: 0;
}
</style>
