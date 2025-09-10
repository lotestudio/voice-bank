<script setup lang="ts">
import { Head, useForm, usePage } from '@inertiajs/vue3'
import AppLayout from '@/layouts/AppLayout.vue'
import { Input } from '@/components/ui/input';
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';


const page = usePage()
const isEdit = !!page.props.model
const form = useForm({
  title: page.props.model?.title ?? ''
})

function submit() {
  if (isEdit) {
    form.put('/admin/sample/' + page.props.model.id)
  } else {
    form.post('/admin/sample')
  }
}
</script>

<template>
  <AppLayout :breadcrumbs="[]">
    <Head :title="isEdit ? 'Edit Sample' : 'Create Sample'" />
    <div class="max-w-xl p-4">
      <form @submit.prevent="submit" class="space-y-4">
        <div class="flex items-center gap-2">
          <label for="title" class="block text-sm font-medium">Title:</label>
          <Input id="title" class="block w-full" v-model="form.title" />
        </div>
        <InputError class="mt-2" :message="form.errors.title" />

        <Button :disabled="form.processing">Save</Button>
      </form>
    </div>
  </AppLayout>
</template>
