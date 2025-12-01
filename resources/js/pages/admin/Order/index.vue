<script setup lang="ts">
import OrderController from '@/actions/App/Http/Controllers/Admin/OrderController';
import DataTable2 from '@/components/DataTable2.vue';
import DtTd from '@/components/DataTable2/dtTd.vue';
import ResetButton from '@/components/DataTable2/Inertia/ResetButton.vue';
import LoteAlertDialog from '@/components/LoteAlertDialog.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, Link, router, usePage } from '@inertiajs/vue3';
import { ref } from 'vue';
import { toast } from 'vue-sonner';
import LoteTooltip from '@/components/LoteTooltip.vue';
import { Badge } from '@/components/ui/badge';
import OrderStatus from '@/components/OrderStatus.vue';
import OrderStatusUpdateForm from '@/pages/admin/Order/OrderStatusUpdateForm.vue';
import LoteSelect from '@/components/LoteSelect.vue';

const page = usePage();
const breadcrumbItems = page.props.breadcrumbs;
const dataTable = ref<InstanceType<typeof DataTable2>>();

const deleteOrder = (id: number) => {
    router.delete(OrderController.destroy(id).url, {
        preserveScroll: true,
        onSuccess: () => {
            if (!dataTable.value) return;
            dataTable.value.refresh();
            toast.success('The Order has been deleted successfully.');
        },
    });
};
</script>

<template>
    <AppLayout :breadcrumbs="breadcrumbItems">
        <Head :title="`Order List`" />
        <div class="p-4">
            <data-table2 :default-url="$page.url" ref="dataTable" :default-url-params="page.props.defaultUrlParams ?? []">
                <template #filters="filterProps">
                    <div class="flex w-full gap-2">
                        <Input
                            class="w-40 border-neutral-300 shadow-none dark:border-neutral-500"
                            placeholder="търси"
                            v-model="filterProps.urlParams.search"
                            @keyup.enter="filterProps.setFilter()"
                        >
                            ></Input
                        >

                        <LoteSelect
                            v-if="page.props.showUserFilter"
                            :options="$page.props.usersSelect"
                            @change="filterProps.setFilter('user_id', $event)"
                            :selected="filterProps.getFilter('user_id') ?? ''"
                        ></LoteSelect>

                        <ResetButton @click.stop.prevent="filterProps.resetFilters()"></ResetButton>
                    </div>
                    <Link :href="OrderController.create.url()">
                        <Button>New Order</Button>
                    </Link>
                </template>
                <template v-slot:tr="trProps">
                    <dt-td column="0">
                        {{ trProps.row.title }}
                    </dt-td>
                    <dt-td column="1">
                        <OrderStatusUpdateForm :order_id="trProps.row.id" :current_status="trProps.row.status" @change="dataTable?.refresh()">
                            <OrderStatus class="cursor-pointer" :label="trProps.row.status_label" :status="trProps.row.status" />
                        </OrderStatusUpdateForm>
                    </dt-td>
                    <dt-td column="2">
                        {{ trProps.row.deadline }}
                    </dt-td>
                    <dt-td column="3">
                        <LoteTooltip>
                            <Badge variant="outline">{{ trProps.row.voices_count }}</Badge>
                            <template #tooltip>
                                <ul>
                                    <li v-for="(artist, index) in trProps.row.artists" :key="index" class="text-sm">
                                        {{ artist }}
                                    </li>
                                </ul>
                            </template>
                        </LoteTooltip>
                    </dt-td>
                    <dt-td column="4">
                        <div class="flex justify-end gap-2">
                            <Button variant="secondary" size="icon" @click="router.visit(OrderController.edit(trProps.row.id).url)">
                                <span class="i-edit"></span>
                            </Button>
                            <LoteAlertDialog
                                dialog-title="Delete Order"
                                dialog-description="Are you sure you want to delete this Order?"
                                confirm-label="Delete"
                                @confirm="deleteOrder(trProps.row.id)"
                            >
                                <Button variant="destructive" size="icon">
                                    <span class="i-trash"></span>
                                </Button>
                            </LoteAlertDialog>
                        </div>
                    </dt-td>
                </template>
            </data-table2>
        </div>
    </AppLayout>
</template>
