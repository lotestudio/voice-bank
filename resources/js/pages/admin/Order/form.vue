<script setup lang="ts">
import { Head, useForm, usePage } from '@inertiajs/vue3'
import AppLayout from '@/layouts/AppLayout.vue'
import { Input } from '@/components/ui/input';
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';
import {useInitialValue} from '@/composables/useInitialFormValue';


const page = usePage()
const { get, isEdit } = useInitialValue();
const form = useForm({
  order_number: get('order_number', ''),
  return_url: get('return_url', null),
})

function submit() {
  if (isEdit) {
    form.put('/admin/order/' + page.props.model.id)
  } else {
    form.post('/admin/order')
  }
}
</script>

<template>
  <AppLayout :breadcrumbs="[]">
    <Head :title="isEdit ? 'Edit Order' : 'Create Order'" />
    <div class="max-w-xl p-4">
      <form @submit.prevent="submit" class="space-y-8">
        <div class="flex items-center gap-2">
          <label for="order_number" class="block text-sm font-medium">Order_number:</label>
          <Input id="order_number" class="block w-full" v-model="form.order_number" />
        </div>
        <InputError class="mt-2" :message="form.errors.order_number" />

        <Button :disabled="form.processing">Save</Button>
      </form>
    </div>
  </AppLayout>
</template>
