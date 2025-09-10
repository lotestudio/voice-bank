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
import PaymentController from '@/actions/App/Http/Controllers/Admin/PaymentController';

const breadcrumbItems = [
  { title: 'Payment List', href: '/admin/payment' },
]

const dataTable = ref<InstanceType<typeof DataTable2>>();

const deletePayment = (id: number) => {
    router.delete(PaymentController.destroy(id).url, {
        preserveScroll: true,
        onSuccess: () => {
            if (!dataTable.value) return;
            dataTable.value.refresh();
            toast.success('The Payment has been deleted successfully.')
        },
    });
};

</script>

<template>
  <AppLayout :breadcrumbs="breadcrumbItems">
    <Head :title="`Payment List`" />
    <div class="p-4">
      <data-table2 :default-url="'/admin/payment'" ref="dataTable">
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
            <Link :href="PaymentController.create.url()">
              <Button>New Payment</Button>
            </Link>
          </template>
        <template v-slot:tr="trProps">
          <dt-td column="0">
            {{ trProps.row.payment_id }}
          </dt-td>
          <dt-td column="1">
              <div class="flex justify-end gap-2">
                  <Button variant="secondary" @click="router.visit(PaymentController.edit(trProps.row.id).url)">
                      <Icon name="edit" />
                  </Button>
                  <LoteAlertDialog
                      trigger-variant="destructive"
                      trigger-label="trash"
                      is-icon
                      dialog-title="Delete Payment"
                      dialog-description="Are you sure you want to delete this Payment?"
                      confirm-label="Delete"
                      @confirm="deletePayment(trProps.row.id)"
                  >
                  </LoteAlertDialog>
              </div>
          </dt-td>
        </template>
      </data-table2>
    </div>
  </AppLayout>
</template>
