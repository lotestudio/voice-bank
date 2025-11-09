<script setup lang="ts">
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, router, usePage } from '@inertiajs/vue3';
import { computed, ref } from 'vue';
import { SlickList, SlickItem } from 'vue-slicksort';
import SortController from '@/actions/App/Http/Controllers/Admin/SortController';
import { toast } from 'vue-sonner';

const page = usePage();
const breadcrumbItems = [{ title: 'Sort List: ' + page.props.model.charAt(0).toUpperCase() + page.props.model.slice(1), href: '/admin/sample' }];

const items = ref(page.props.items);

const sorted_items = computed(() => {
    return items.value.map((item, index) => {
        const res = {};
        res['id'] = item.id;
        res[page.props.order_column] = index + 1;

        return res;
    });
});

const save = () => {
    router.post(
        SortController.store().url,
        {
            model: page.props.model,
            order_column: page.props.order_column,
            items: sorted_items.value,
        },
        {
            preserveScroll: true,
            onSuccess: () => {
                toast.success('Items reordered successfully.');
            },
        },
    );
};

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
        <div class="max-w-2xl p-4">
            <SlickList axis="y" v-model:list="items" class="space-y-2" @update:list="save">
                <SlickItem v-for="(item, i) in items" :key="item.id" :index="i" class="rounded bg-secondary-foreground p-2 text-black select-none">
                    {{ i + 1 }}. {{ getTranslation(item[page.props.display_value]) }}
                </SlickItem>
            </SlickList>
        </div>
    </AppLayout>
</template>
