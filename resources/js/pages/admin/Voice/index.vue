<script setup lang="ts">
import VoiceController from '@/actions/App/Http/Controllers/Admin/VoiceController';
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
import LoteSwitch from '@/components/LoteSwitch.vue';
import {show} from '@/routes/voice';

const breadcrumbItems = [{ title: 'Voice List', href: '/admin/voice' }];

const dataTable = ref<InstanceType<typeof DataTable2>>();

const deleteVoice = (id: number) => {
    router.delete(VoiceController.destroy(id).url, {
        preserveScroll: true,
        onSuccess: () => {
            if (!dataTable.value) return;
            dataTable.value.refresh();
            toast.success('The Voice has been deleted successfully.');
        },
    });
};
</script>

<template>
    <AppLayout :breadcrumbs="breadcrumbItems">
        <Head :title="`Voice List`" />
        <div class="p-4">
            <data-table2 :default-url="'/admin/voice'" ref="dataTable">
                <template #filters="filterProps">
                    <div class="flex w-full gap-2">
                        <Input
                            class="w-40 border-neutral-300 shadow-none dark:border-neutral-500"
                            placeholder="търси"
                            v-model="filterProps.urlParams.search"
                            @keyup.enter="filterProps.setFilter()"
                        />
                        <ResetButton @click.stop.prevent="filterProps.resetFilters()"></ResetButton>
                    </div>
                    <div class="flex gap-2">
                        <Link :href="VoiceController.create.url()">
                            <Button>New Voice</Button>
                        </Link>
                    </div>
                </template>
                <template v-slot:tr="trProps">
                    <dt-td column="0">
                        <Link :href="show.url(trProps.row.id)">{{ trProps.row.title.bg }}</Link>
                    </dt-td>
                    <dt-td column="1">
                        {{trProps.row.user_name}}
                    </dt-td>
                    <dt-td column="2">
                        <LoteSwitch :default-state="trProps.row.is_active" :url="'/admin/voice/' + trProps.row.id + '/toggle-status'" />
                    </dt-td>
                    <dt-td column="3">
                        <div class="flex justify-end gap-2">
                            <Button variant="secondary" size="icon" @click="router.visit(VoiceController.edit(trProps.row.id).url)">
                                <span class="i-edit"></span>
                            </Button>
                            <LoteAlertDialog
                                trigger-variant="destructive"
                                trigger-label="trash"
                                is-icon
                                dialog-title="Delete Voice"
                                dialog-description="Are you sure you want to delete this Voice?"
                                confirm-label="Delete"
                                @confirm="deleteVoice(trProps.row.id)"
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
