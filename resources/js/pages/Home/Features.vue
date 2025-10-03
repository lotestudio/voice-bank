<script setup lang="ts">
import { Card, CardContent } from '@/components/ui/card';
import { Carousel, CarouselContent, CarouselItem, CarouselNext, CarouselPrevious } from '@/components/ui/carousel';

defineProps({
    'features': Array,
})


const icons = ['i-clock', 'i-document', 'i-userStar', 'i-chat', 'i-auto'];

</script>

<template>
    <div class="mx-auto mt-10 w-full px-16">
        <Carousel
            class="relative w-full"
            :opts="{
                align: 'start',
            }"
        >
            <CarouselContent>
                <CarouselItem v-for="(feature, index) in features" :key="index" class="md:basis-1/3 2xl:basis-1/5">
                    <div class="h-full p-1">
                        <Card class="h-full">
                            <CardContent class="flex flex-col px-6 py-2 h-full">
                                <div class="mb-4 text-6xl text-primary">
                                    <span :class="icons[index]"></span>
                                </div>

                                <div class="mt-auto">
                                    <p class="text-xl font-semibold">{{ feature.title }}</p>
                                    <p class="">{{ feature.excerpt }}</p>
                                </div>
                            </CardContent>
                        </Card>
                    </div>
                </CarouselItem>
            </CarouselContent>
            <CarouselPrevious class="xl:hidden" />
            <CarouselNext class="xl:hidden" />
        </Carousel>
    </div>
</template>


