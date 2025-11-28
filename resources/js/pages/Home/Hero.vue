<script setup lang="ts">
import { Button } from '@/components/ui/button';
import { useLocale } from '@/composables/useLocale';
import {login} from '@/routes';
import { create } from '@/routes/orders'
import { Link } from '@inertiajs/vue3';
import { useAuth } from '@/composables/useAuth';

defineProps({
    content: Object,
});

const { T,locale_url } = useLocale();
const {isArtist, isClient,isAdmin} = useAuth();



</script>

<template>
    <div class="container mx-auto mt-10 px-8">
        <h1 class="mx-auto mb-1 max-w-4xl text-center text-2xl font-bold text-balance md:text-xl lg:text-3xl" v-html="content.title"></h1>
        <h2 class="mx-auto my-8 max-w-2xl text-center text-balance md:text-lg lg:text-2xl">{{ content.excerpt }}</h2>
        <div class="mx-auto flex max-w-2xl justify-center gap-4">

            <template v-if="isAdmin">
                <Link :href="'/admin/dashboard'">
                <Button variant="default" size="lg">Admin panel</Button>
                </Link>
            </template>

            <template v-else-if="isClient">
                <Link :href="locale_url(create.url())">
                <Button variant="default" size="lg">{{ T('order') }}</Button>
                </Link>
                <Link :href="locale_url('/profile/settings')">
                    <Button variant="secondary" size="lg">{{T('Profile')}}</Button>
                </Link>
            </template>

            <template v-else-if="isArtist">
                <Link :href="locale_url('/profile/settings')">
                    <Button variant="secondary" size="lg">{{T('Profile')}}</Button>
                </Link>
            </template>

            <template v-else>
                <Link :href="login.url() + '?default_role=client'">
                    <Button variant="default" size="lg">{{ T('order') }}</Button>
                </Link>
                <Link :href="login.url() + '?default_role=artist'">
                    <Button variant="secondary" size="lg">{{T('become an artist')}}</Button>
                </Link>
            </template>

        </div>
    </div>
</template>
