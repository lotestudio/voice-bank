<script setup lang="ts">
import { Card, CardContent } from '@/components/ui/card';
import { Carousel, CarouselContent, CarouselItem, CarouselNext, CarouselPrevious } from '@/components/ui/carousel';

const features = [
    {
        icon: 'i-clock',
        heading: 'Оперативност',
        body: 'Нашите артисти изпълняват записите в срок',
    },
    {
        icon: 'i-document',
        heading: 'Документ за записа',
        body: 'Към всеки запис клиентът получава документ за авторски права',
    },
    {
        icon: 'i-userStar',
        heading: 'Професионализъм',
        body: 'Следим и контролираме нивото на артистите, като отчитаме мнението на нашите клиент',
    },
    {
        icon: 'i-chat',
        heading: 'Поддръжка',
        body: 'Предоставяме консултации на всички етапи от пръчката',
    },
    {
        icon: 'i-auto',
        heading: 'Автоматизация',
        body: 'Вашата намеса е сведена до минимум - плащане и получаване на поръчката стават автоматично',
    },
];
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
                                    <span :class="feature.icon"></span>
                                </div>

                                <div class="mt-auto">
                                    <p class="text-xl font-semibold">{{ feature.heading }}</p>
                                    <p class="">{{ feature.body }}</p>
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
