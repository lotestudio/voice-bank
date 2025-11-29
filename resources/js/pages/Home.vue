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
import LoteToggleGroup from '@/components/LoteToggleGroup.vue';
import { ref } from 'vue';

const page = usePage();
const contents = page.props.contents;
const features = page.props.features;
const calculatorCountArtists = ref(1);
const calculatorContent=ref('');
</script>

<template>
    <Head title="Welcome"> </Head>

    <SiteLayout>
        <div class="absolute left-1/2 w-full -translate-x-1/2">
            <div class="relative flex h-[450px] w-full flex-col items-center justify-center overflow-hidden md:w-full lg:w-full">
                <!--                <Ripple-->
                <!--                    class="bg-primary/20 [mask-image:linear-gradient(to_bottom,white,transparent)]"-->
                <!--                    circle-class="border-primary bg-[#0000]/25 dark:bg-primary/25 rounded-full"-->
                <!--                />-->
                <Ripple
                    class="bg-accent dark:bg-primary/10 dark:[mask-image:linear-gradient(to_bottom,white,transparent)]"
                    circle-class="dark:border-primary border-secondary rounded-full dark:bg-primary/20 bg-white"
                />
            </div>
        </div>
        <Hero class="z-10" :content="contents['home.hero']"></Hero>
        <Features class="z-10" :features="features"></Features>
        <FeaturedVoices></FeaturedVoices>
        <LatestOrders :content="contents['home.latest_orders']"></LatestOrders>
        <Collaboration :content="contents['home.get_involved']"></Collaboration>

        <div class="container mx-auto mt-10 space-y-10 px-8">
            <div class="mx-auto max-w-2xl">
                <h2 class="mb-1 text-center text-3xl font-bold tracking-tighter">
                    {{ contents['home.order_calculator'].title }}
                </h2>
                <p class="text-center text-balance">
                    {{ contents['home.order_calculator'].excerpt }}
                </p>
                <div class="space-y-4 mt-4">
                    <div class="flex items-center gap-4 justify-center">
                        <div>{{page.props.select_number_of_voices}}</div>
                        <LoteToggleGroup
                            :options="[
                                {'label':1, 'value':'1'},
                                {'label':2, 'value':'2'},
                                {'label':3, 'value':'3'},
                                {'label':4, 'value':'4'},
                                {'label':5, 'value':'5'}
                            ]"

                            class="block"
                            type="single"
                            :selected="calculatorCountArtists+''"
                            @update:selected="calculatorCountArtists = $event"
                        ></LoteToggleGroup>
                    </div>
                    <OrderCalculator class="mt-4" v-model="calculatorContent" :artist_count="Number(calculatorCountArtists)"></OrderCalculator>
                </div>
            </div>
        </div>
    </SiteLayout>
</template>
