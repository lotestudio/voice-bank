<script setup lang="ts">
import { ref } from 'vue';
import { Head, Link, router } from '@inertiajs/vue3'
import AppLayout from '@/layouts/AppLayout.vue'
import DataTable2 from '@/components/DataTable2.vue'
import DtTd from '@/components/DataTable2/dtTd.vue'
import LoteAlertDialog from '@/components/LoteAlertDialog.vue';
import Icon from '@/components/Icon.vue';
import ResetButton from '@/components/DataTable2/Inertia/ResetButton.vue';
import { Button } from '@/components/ui/button';
import { toast } from 'vue-sonner'
import OrderController from '@/actions/App/Http/Controllers/Admin/OrderController';
import { Input } from '@/components/ui/input';

const breadcrumbItems = [
  { title: 'Order List', href: '/admin/order' },
]

const dataTable = ref<InstanceType<typeof DataTable2>>();

const deleteOrder = (id: number) => {
    router.delete(OrderController.destroy(id).url, {
        preserveScroll: true,
        onSuccess: () => {
            if (!dataTable.value) return;
            dataTable.value.refresh();
            toast.success('The Order has been deleted successfully.')
        },
    });
};

</script>

<template>
  <AppLayout :breadcrumbs="breadcrumbItems">
    <Head :title="`Order List`" />
    <div class="p-4">
      <data-table2 :default-url="'/admin/order'" ref="dataTable">
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
            <Link :href="OrderController.create.url()">
              <Button>New Order</Button>
            </Link>
          </template>
        <template v-slot:tr="trProps">
          <dt-td column="0">
            {{ trProps.row.order_number }}
          </dt-td>
          <dt-td column="1">
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
