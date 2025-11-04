<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, usePage } from '@inertiajs/vue3';
import { ref } from 'vue';
import { SlickList, SlickItem } from 'vue-slicksort';

const page = usePage();
const breadcrumbItems = [{ title: 'Sort List:' + page.props.model, href: '/admin/sample' }];

const items = ref(page.props.items);

const getTranslation = (object: string | Record<string, string>): string => {
    if (typeof object === 'object' && 'en' in object) {
        return object['en'];
    }
    return object as string;
};
</script>

<template>
    <AppLayout :breadcrumbs="breadcrumbItems">
        <Head :title="`Sort List: ` + page.props.model" />
        <div class="p-4 max-w-2xl">
            <SlickList axis="y" v-model:list="items" class="space-y-2">
                <SlickItem v-for="(item, i) in items" :key="item.id" :index="i" class="rounded p-2 select-none bg-secondary-foreground text-black">
                    {{ getTranslation(item[page.props.display_value]) }}
                </SlickItem>
            </SlickList>
        </div>

        <pre>
            {{ items }}
        </pre>

    </AppLayout>
</template>
