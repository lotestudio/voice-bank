<script setup lang="ts">
import { ref } from 'vue';
import { Head, Link, router } from '@inertiajs/vue3'
import AppLayout from '@/layouts/AppLayout.vue'
import DataTable2 from '@/components/DataTable2.vue'
import DtTd from '@/components/DataTable2/dtTd.vue'
import LoteAlertDialog from '@/components/LoteAlertDialog.vue';
import ResetButton from '@/components/DataTable2/Inertia/ResetButton.vue';
import { Input } from '@/components/ui/input';
import { Button } from '@/components/ui/button';
import { toast } from 'vue-sonner'
import PostController from '@/actions/App/Http/Controllers/Admin/PostController';

const breadcrumbItems = [
  { title: 'Post List', href: '/admin/post' },
]

const dataTable = ref<InstanceType<typeof DataTable2>>();

const deletePost = (id: number) => {
    router.delete(PostController.destroy(id).url, {
        preserveScroll: true,
        onSuccess: () => {
            if (!dataTable.value) return;
            dataTable.value.refresh();
            toast.success('The Post has been deleted successfully.')
        },
    });
};

</script>

<template>
  <AppLayout :breadcrumbs="breadcrumbItems">
    <Head :title="`Post List`" />
    <div class="p-4">
      <data-table2 :default-url="'/admin/post'" ref="dataTable">
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
            <Link :href="PostController.create.url()">
              <Button>New Post</Button>
            </Link>
          </template>
        <template v-slot:tr="trProps">
          <dt-td column="0">
            {{ trProps.row.title }}
          </dt-td>
            <dt-td column="1">
            {{ trProps.row.section }}
          </dt-td>
          <dt-td column="1">
              <div class="flex justify-end gap-2">
                  <Button variant="secondary" size="icon" @click="router.visit(PostController.edit(trProps.row.id).url)">
                      <div class="i-edit"></div>
                  </Button>
                  <LoteAlertDialog
                      dialog-title="Delete Post"
                      dialog-description="Are you sure you want to delete this Post?"
                      confirm-label="Delete"
                      @confirm="deletePost(trProps.row.id)"
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
