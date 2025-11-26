<script setup lang="ts">
import UserController from '@/actions/App/Http/Controllers/Admin/UserController';
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
import LoteSelect from '@/components/LoteSelect.vue';
import { Avatar, AvatarFallback, AvatarImage} from '@/components/ui/avatar';

const breadcrumbItems = [{ title: 'User List', href: '/admin/user' }];

const dataTable = ref<InstanceType<typeof DataTable2>>();

const deleteUser = (id: number) => {
    router.delete(UserController.destroy(id).url, {
        preserveScroll: true,
        onSuccess: () => {
            if (!dataTable.value) return;
            dataTable.value.refresh();
            toast.success('The User has been deleted successfully.');
        },
    });
};
</script>

<template>
    <AppLayout :breadcrumbs="breadcrumbItems">
        <Head :title="`User List`" />
        <div class="p-4">
            <data-table2 :default-url="'/admin/user'" ref="dataTable">
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
                            :options="[
                                { label: 'Choose role', value: '' },
                                { label: 'Artist', value: 'artist' },
                                { label: 'Client', value: 'client' },
                                { label: 'Admin', value: 'admin' },
                                { label: 'Developer', value: 'dev' },
                            ]"
                            @change="filterProps.setFilter('role', $event)"
                            :selected="filterProps.getFilter('role') || ''"
                        ></LoteSelect>

                        <ResetButton @click.stop.prevent="filterProps.resetFilters()"></ResetButton>
                    </div>
                    <Link :href="UserController.create.url()">
                        <Button>New User</Button>
                    </Link>
                </template>
                <template v-slot:tr="trProps">
                    <dt-td column="0">
                        <div class="flex gap-2 items-center">
                            <Avatar
                                class="flex h-10 w-10 cursor-pointer items-center justify-center bg-sidebar-accent"
                            >
                                <AvatarImage :src="trProps.row.avatar.url" :alt="trProps.row.avatar.initials" />
                                <AvatarFallback class="text-xs font-bold">{{ trProps.row.avatar.initials }}</AvatarFallback>
                            </Avatar>

                            <Link :href="UserController.show(trProps.row.id)">
                                {{ trProps.row.name }}
                            </Link>
                        </div>
                    </dt-td>
                    <dt-td column="1">
                        {{ trProps.row.email }}
                    </dt-td>
                    <dt-td column="2">
                        {{ trProps.row.role }}
                    </dt-td>
                    <dt-td column="3">
                        <div class="flex justify-end gap-2">
                            <Button size="icon" @click="router.visit('/impersonate/take/'+trProps.row.id)">
                                <span class="i-ghost"></span>
                            </Button>
                            <Button variant="secondary" size="icon" @click="router.visit(UserController.edit(trProps.row.id))">
                                <span class="i-edit"></span>
                            </Button>
                            <LoteAlertDialog
                                dialog-title="Delete User"
                                dialog-description="Are you sure you want to delete this User?"
                                confirm-label="Delete"
                                @confirm="deleteUser(trProps.row.id)"
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
