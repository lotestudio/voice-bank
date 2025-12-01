<script setup lang="ts">
import { Button } from '@/components/ui/button';
import { useLocale } from '@/composables/useLocale.ts';
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from '@/components/ui/card';

import { show } from '@/actions/App/Http/Controllers/Profile/OrdersController';
import { Link } from '@inertiajs/vue3';
import OrderStatus from '@/components/OrderStatus.vue';

const { T } = useLocale();

defineProps({
    order: {
        type: Object,
        required: true,
    },
});

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
            <OrderStatus :label="order.status_label" :status="order.status"/>
        </CardFooter>
    </Card>
</template>

<style scoped></style>
