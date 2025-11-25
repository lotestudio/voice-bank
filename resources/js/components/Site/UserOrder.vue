<script setup lang="ts">
import { Button } from '@/components/ui/button';
import { useLocale } from '@/composables/useLocale.ts';
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from '@/components/ui/card';

import { show } from '@/actions/App/Http/Controllers/Profile/OrdersController';
import { Link } from '@inertiajs/vue3';

const { T } = useLocale();

defineProps({
    order: {
        type: Object,
        required: true,
    },
});

const statusStyle = {
    pending: 'border-yellow-500/20 text-yellow-500 bg-yellow-500/10',
    accepted: 'border-blue-500/20 text-blue-500 bg-blue-500/10',
    in_progress: 'border-purple-500/20 text-purple-500 bg-purple-500/10',
    completed: 'border-green-500/20 text-green-500 bg-green-500/10',
    cancelled: 'border-red-500/20 text-red-500 bg-red-500/10',
    refunded: 'border-gray-500/20 text-gray-500 bg-gray-500/10',
};
</script>

<template>
    <Card class="w-full">
        <CardHeader>
            <CardTitle>{{ order.title }}</CardTitle>
            <CardDescription>{{ order.description }}</CardDescription>
        </CardHeader>
        <CardContent> </CardContent>
        <CardFooter class="mt-auto flex-col gap-4">
            <Button as-child>
                <Link :href="show.url(order.id)">{{ T('details') }}</Link>
            </Button>
            <div :class="statusStyle[order.status]" class="text-sm border rounded py-1 px-2">{{ order.status_label }}</div>
        </CardFooter>
    </Card>
</template>

<style scoped></style>
