<script setup lang="ts">
import { Head, usePage } from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import { useLocale } from '@/composables/useLocale';
import Logo from '@/components/Site/Logo.vue';
import { Button } from '@/components/ui/button';
const locale = usePage().props.locale;
const { T } = useLocale()
</script>

<template>
    <Head title="Welcome">
    </Head>
    <SiteLayout>
        <div class="container mx-auto mt-10 px-8">
<!--            <div class="flex justify-center">-->
<!--                <Logo width="1000px"/>-->
<!--            </div>-->

            <h1 class="mb-1 font-bold text-2xl md:text-xl lg:text-3xl text-center text-balance max-w-4xl mx-auto">
                Озвучаваме текстове и създаваме аудиореклами за всеки тип дигитална медия.
            </h1>
            <h2 class="my-8  md:text-lg lg:text-2xl text-center text-balance max-w-2xl mx-auto">
                Радио, телевизия, интернет, подкасти, аудиокниги, пародии и вокални партии.
                <br>
                Пишем сценарии и предлагаме професионална дикторско озвучаване.
            </h2>

            <div class="max-w-2xl mx-auto justify-center flex gap-4">
                <Button variant="default" size="lg">Поръчай</Button>
                <Button variant="secondary" size="lg">Стани диктор</Button>
            </div>

        </div>


    </SiteLayout>
</template>


