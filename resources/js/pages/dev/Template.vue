<script setup lang="ts">
import { Head, usePage } from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import { useLocale } from '@/composables/useLocale';
import { Button } from '@/components/ui/button';
import LangSwitcher from '@/components/Site/LangSwitcher.vue';
import AppearanceTabs from '@/components/AppearanceTabs.vue';
const locale = usePage().props.locale;
const { T } = useLocale()
</script>

<template>
    <Head title="Welcome">
    </Head>
    <SiteLayout>
        <div class="container mx-auto mt-10 px-8">
            <h1 class="font-bold text-3xl">Tepmlate/Темплейт</h1>
            <h2 class="font-bold text-xl">Voice Bank</h2>


            <div class="py-8">
                <AppearanceTabs></AppearanceTabs>
            </div>

            <hr>
            <div class="flex gap-4 py-8">
                <Button type>Click me</Button>
                <Button variant="secondary">Click me</Button>
                <Button variant="ghost">Click me</Button>
                <Button variant="link">Click me</Button>
                <Button variant="destructive">Click me</Button>
                <Button variant="default" disabled>Click me</Button>
            </div>
            <hr>
                <div class="flex gap-4 py-8">
                    <span class="i-circleMenu text-xl"></span>
                </div>
            <hr>

            <main class="max-w-[65ch] mt-8 space-y-4">
                <h2 class="mb-1 font-bold text-3xl tracking-tighter uppercase">What is Lorem Ipsum?</h2>
                <p>Lorem Ipsum is simply dummy text of the <a href="https://google.com">printing</a> and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>




                <h2 class="mb-1 font-bold text-3xl tracking-tighter uppercase">Why do we use it?</h2>
                <p>It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).</p>

                <h2 class="mb-1 font-bold text-3xl tracking-tighter uppercase">Откъде произлиза?</h2>
                <p>Противно на всеобщото вярване, Lorem Ipsum не е просто случаен текст. Неговите корени са в класическата Латинска литература от 45г.пр.Хр., което прави преди повече от 2000 години. Richard McClintock, професор по Латински от колежа Hampden-Sydney College във Вирджиния, изучавайки една от най-неясните латински думи "consectetur" в един от пасажите на Lorem Ipsum, и търсейки цитати на думата в класическата литература, открива точния източник. Lorem Ipsum е намерен в секции 1.10.32 и 1.10.33 от "de Finibus Bonorum et Malorum"(Крайностите на Доброто и Злото) от Цицерон, написан през 45г.пр.Хр. Тази книга е трактат по теория на етиката, много популярна през Ренесанса. Първият ред на Lorem Ipsum идва от ред, намерен в секция 1.10.32.</p>
                <p>Стандартният отрязък от Lorem Ipsum, използван от 1500 г. насам, е поместен по-долу за тези, които се интересуват. Секции 1.10.32 и 1.10.33 от "de Finibus Bonorum et Malorum" на Цицерон също са поместени в оригиналния им формат, заедно с превода им на английски език, направен от.</p>


            </main>
        </div>
    </SiteLayout>
</template>
