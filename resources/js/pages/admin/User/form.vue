<script setup lang="ts">
import { Head, useForm, usePage } from '@inertiajs/vue3'
import AppLayout from '@/layouts/AppLayout.vue'
import { Input } from '@/components/ui/input';
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';


const page = usePage()
const isEdit = !!page.props.model
const form = useForm({
  name: page.props.model?.name ?? ''
})

function submit() {
  if (isEdit) {
    form.put('/admin/user/' + page.props.model.id)
  } else {
    form.post('/admin/user')
  }
}
</script>

<template>
  <AppLayout :breadcrumbs="[]">
    <Head :title="isEdit ? 'Edit User' : 'Create User'" />
    <div class="max-w-xl p-4">
      <form @submit.prevent="submit" class="space-y-4">
        <div class="flex items-center gap-2">
          <label for="name" class="block text-sm font-medium">Name:</label>
          <Input id="name" class="block w-full" v-model="form.name" />
        </div>
        <InputError class="mt-2" :message="form.errors.name" />

        <Button :disabled="form.processing">Save</Button>
      </form>
    </div>
  </AppLayout>
</template>
