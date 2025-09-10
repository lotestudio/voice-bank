<script setup lang="ts">
import { ref } from 'vue';
import { Head, Link, router } from '@inertiajs/vue3'
import AppLayout from '@/layouts/AppLayout.vue'
import DataTable2 from '@/components/DataTable2.vue'
import DtTd from '@/components/DataTable2/dtTd.vue'
import LoteAlertDialog from '@/components/LoteAlertDialog.vue';
import Icon from '@/components/Icon.vue';
import ResetButton from '@/components/DataTable2/Inertia/ResetButton.vue';
import { Input } from '@/components/ui/input';
import { Button } from '@/components/ui/button';
import { toast } from 'vue-sonner'
import UserController from '@/actions/App/Http/Controllers/Admin/UserController';

const breadcrumbItems = [
  { title: 'User List', href: '/admin/user' },
]

const dataTable = ref<InstanceType<typeof DataTable2>>();

const deleteUser = (id: number) => {
    router.delete(UserController.destroy(id).url, {
        preserveScroll: true,
        onSuccess: () => {
            if (!dataTable.value) return;
            dataTable.value.refresh();
            toast.success('The User has been deleted successfully.')
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
            <div class="flex gap-2 w-full">
              <Input
                  class="w-40 border-neutral-300 dark:border-neutral-500 shadow-none"
                  placeholder="търси"
                  v-model="filterProps.urlParams.search"
                  @keyup.enter="filterProps.setFilter()">
              ></Input>
              <ResetButton @click.stop.prevent="filterProps.resetFilters()"></ResetButton>
            </div>
            <Link :href="UserController.create.url()">
              <Button>New User</Button>
            </Link>
          </template>
        <template v-slot:tr="trProps">
          <dt-td column="0">
            {{ trProps.row.name }}
          </dt-td>
          <dt-td column="1">
              <div class="flex justify-end gap-2">
                  <Button variant="secondary" @click="router.visit(UserController.edit(trProps.row.id))">
                      <Icon name="edit" />
                  </Button>
                  <LoteAlertDialog
                      trigger-variant="destructive"
                      trigger-label="trash"
                      is-icon
                      dialog-title="Delete User"
                      dialog-description="Are you sure you want to delete this User?"
                      confirm-label="Delete"
                      @confirm="deleteUser(trProps.row.id)"
                  >
                  </LoteAlertDialog>
              </div>
          </dt-td>
        </template>
      </data-table2>
    </div>
  </AppLayout>
</template>
