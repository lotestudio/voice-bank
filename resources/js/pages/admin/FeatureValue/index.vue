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
import FeatureValueController from '@/actions/App/Http/Controllers/Admin/FeatureValueController';
import LoteSelect from '@/components/LoteSelect.vue';

defineProps({
    featureSelect:{
        type:Array,
    }
})




const breadcrumbItems = [
  { title: 'FeatureValue List', href: '/admin/feature-value' },
]

const dataTable = ref<InstanceType<typeof DataTable2>>();

const deleteFeatureValue = (id: number) => {
    router.delete(FeatureValueController.destroy(id).url, {
        preserveScroll: true,
        onSuccess: () => {
            if (!dataTable.value) return;
            dataTable.value.refresh();
            toast.success('The FeatureValue has been deleted successfully.')
        },
    });
};


//class="w-40 outline outline-border outline-offset-[-1px] shadow-none" ???
</script>

<template>
  <AppLayout :breadcrumbs="breadcrumbItems">
    <Head :title="`FeatureValue List`" />
    <div class="p-4">
      <data-table2 :default-url="'/admin/feature-value'" ref="dataTable">
          <template #filters="filterProps">
            <div class="flex gap-2 w-full">
              <Input
                  class="w-40 border-neutral-300 dark:border-neutral-500 shadow-none"

                  placeholder="търси"
                  v-model="filterProps.urlParams.search"
                  @keyup.enter="filterProps.setFilter()">
              ></Input>
                <LoteSelect :options="featureSelect" @change="filterProps.setFilter('feature_id',$event)" :selected="filterProps.getFilter('feature_id') ?? null"></LoteSelect>
              <ResetButton @click.stop.prevent="filterProps.resetFilters()"></ResetButton>
            </div>
            <Link :href="FeatureValueController.create.url()">
              <Button>New FeatureValue</Button>
            </Link>
          </template>
        <template v-slot:tr="trProps">
          <dt-td column="0">
            {{ trProps.row.display_value.bg }} / {{ trProps.row.display_value.en }}
          </dt-td>
            <dt-td column="1">
            {{ trProps.row.feature.display_name.en }}
          </dt-td>
          <dt-td column="2">
              <div class="flex justify-end gap-2">
                  <Button variant="secondary" @click="router.visit(FeatureValueController.edit(trProps.row.id).url)">
                      <Icon name="edit" />
                  </Button>
                  <LoteAlertDialog
                      trigger-variant="destructive"
                      trigger-label="trash"
                      is-icon
                      dialog-title="Delete FeatureValue"
                      dialog-description="Are you sure you want to delete this FeatureValue?"
                      confirm-label="Delete"
                      @confirm="deleteFeatureValue(trProps.row.id)"
                  >
                  </LoteAlertDialog>
              </div>
          </dt-td>
        </template>
      </data-table2>
    </div>
  </AppLayout>
</template>
