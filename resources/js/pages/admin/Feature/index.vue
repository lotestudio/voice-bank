<script setup lang="ts">
import FeatureController from '@/actions/App/Http/Controllers/Admin/FeatureController';
import DataTable2 from '@/components/DataTable2.vue';
import DtTd from '@/components/DataTable2/dtTd.vue';
import ResetButton from '@/components/DataTable2/Inertia/ResetButton.vue';
import LoteAlertDialog from '@/components/LoteAlertDialog.vue';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, Link, router } from '@inertiajs/vue3';
import { ref } from 'vue';
import { toast } from 'vue-sonner';

const breadcrumbItems = [{ title: 'Feature List', href: '/admin/feature' }];

const dataTable = ref<InstanceType<typeof DataTable2>>();

const deleteFeature = (id: number) => {
    router.delete(FeatureController.destroy(id).url, {
        preserveScroll: true,
        onSuccess: () => {
            if (!dataTable.value) return;
            dataTable.value.refresh();
            toast.success('The Feature has been deleted successfully.');
        },
    });
};
</script>

<template>
    <AppLayout :breadcrumbs="breadcrumbItems">
        <Head :title="`Feature List`" />
        <div class="p-4">
            <data-table2 :default-url="'/admin/feature'" ref="dataTable">
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
                        <ResetButton @click.stop.prevent="filterProps.resetFilters()"></ResetButton>
                    </div>
                    <Link :href="FeatureController.create.url()">
                        <Button>New Feature</Button>
                    </Link>
                </template>
                <template v-slot:tr="trProps">
                    <dt-td column="0">
                        {{ trProps.row.display_name.bg }}
                    </dt-td>
                    <dt-td column="1">
                        {{ trProps.row.name}}
                    </dt-td>
                    <dt-td column="2">
                        {{ trProps.row.values_count}}
                    </dt-td>
                    <dt-td column="3">
                        {{ trProps.row.is_filterable}}
                    </dt-td>
                    <dt-td column="4">
                        {{ trProps.row.sort_order}}
                    </dt-td>
                    <dt-td column="5">
                        <div class="flex justify-end gap-2">
                            <Button variant="secondary" size="icon" @click="router.visit(FeatureController.edit(trProps.row.id).url)">
                                <span class="is-edit"></span>
                            </Button>
                            <LoteAlertDialog
                                dialog-title="Delete Feature"
                                dialog-description="Are you sure you want to delete this Feature?"
                                confirm-label="Delete"
                                @confirm="deleteFeature(trProps.row.id)"
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
