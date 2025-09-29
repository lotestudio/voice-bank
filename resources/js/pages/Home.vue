<script setup lang="ts">
import { Head, usePage } from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
// import { useLocale } from '@/composables/useLocale';
import Hero from '@/pages/Home/Hero.vue';
import Features from '@/pages/Home/Features.vue';
// const locale = usePage().props.locale;
// const { T } = useLocale()

import { Ripple } from '@/components/ui/ripple';
import FeaturedVoices from '@/pages/Home/FeaturedVoices.vue';
import LatestOrders from '@/pages/Home/LatestOrders.vue';
import Collaboration from '@/pages/Home/Collaboration.vue';
import OrderCalculator from '@/pages/Home/OrderCalculator.vue';


</script>

<template>
    <Head title="Welcome"> </Head>

    <SiteLayout>
        <div class="absolute left-1/2 w-full -translate-x-1/2">
            <div class="relative flex h-[450px] w-full flex-col items-center justify-center overflow-hidden rounded-lg md:w-full lg:w-full">
                <!--                <Ripple-->
                <!--                    class="bg-primary/20 [mask-image:linear-gradient(to_bottom,white,transparent)]"-->
                <!--                    circle-class="border-primary bg-[#0000]/25 dark:bg-primary/25 rounded-full"-->
                <!--                />-->
                <Ripple
                    class="[mask-image:linear-gradient(to_bottom,white,transparent)] dark:bg-primary/10"
                    circle-class="dark:border-primary border-secondary rounded-full dark:bg-primary/20 bg-gold-100/10"
                />
            </div>
        </div>
        <Hero class="z-10"></Hero>
        <Features class="z-10"></Features>
        <FeaturedVoices></FeaturedVoices>
        <LatestOrders></LatestOrders>
        <Collaboration></Collaboration>
        <OrderCalculator></OrderCalculator>
    </SiteLayout>
</template>
