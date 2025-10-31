<script setup lang="ts">
import { Head, useForm, usePage } from '@inertiajs/vue3'
import AppLayout from '@/layouts/AppLayout.vue'
import { Input } from '@/components/ui/input';
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';


const page = usePage()
const isEdit = !!page.props.model
const form = useForm({
  user_id: page.props.model?.user_id ?? ''
})

function submit() {
  if (isEdit) {
    form.put('/admin/review/' + page.props.model.id)
  } else {
    form.post('/admin/review')
  }
}
</script>

<template>
  <AppLayout :breadcrumbs="[]">
    <Head :title="isEdit ? 'Edit Review' : 'Create Review'" />
    <div class="max-w-xl p-4">
      <form @submit.prevent="submit" class="space-y-8">
        <div class="flex items-center gap-2">
          <label for="user_id" class="block text-sm font-medium">User_id:</label>
          <Input id="user_id" class="block w-full" v-model="form.user_id" />
        </div>
        <InputError class="mt-2" :message="form.errors.user_id" />

        <Button :disabled="form.processing">Save</Button>
      </form>
    </div>
  </AppLayout>
</template>
