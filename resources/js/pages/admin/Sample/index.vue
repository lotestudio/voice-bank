<script setup lang="ts">
import SampleController from '@/actions/App/Http/Controllers/Admin/SampleController';
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

const breadcrumbItems = [{ title: 'Sample List', href: '/admin/sample' }];

const dataTable = ref<InstanceType<typeof DataTable2>>();

const deleteSample = (id: number) => {
    router.delete(SampleController.destroy(id).url, {
        preserveScroll: true,
        onSuccess: () => {
            if (!dataTable.value) return;
            dataTable.value.refresh();
            toast.success('The Sample has been deleted successfully.');
        },
    });
};
</script>

<template>
    <AppLayout :breadcrumbs="breadcrumbItems">
        <Head :title="`Sample List`" />
        <div class="p-4">
            <data-table2 :default-url="'/admin/sample'" ref="dataTable">
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
                    <Link :href="SampleController.create.url()">
                        <Button>New Sample</Button>
                    </Link>
                </template>
                <template v-slot:tr="trProps">
                    <dt-td column="0">
                        {{ trProps.row.title.bg }}
                    </dt-td>
                    <dt-td column="1">
                        {{ trProps.row.voice_user_name }}
                    </dt-td>
                    <dt-td column="2">
                        <div class="flex justify-end gap-2">
                            <Button variant="secondary" size="icon" @click="router.visit(SampleController.edit(trProps.row.id).url)">
                                <span class="i-edit"></span>
                            </Button>
                            <LoteAlertDialog
                                trigger-variant="destructive"
                                trigger-label="trash"
                                is-icon
                                dialog-title="Delete Sample"
                                dialog-description="Are you sure you want to delete this Sample?"
                                confirm-label="Delete"
                                @confirm="deleteSample(trProps.row.id)"
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
