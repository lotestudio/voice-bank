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
  payment_id: get('payment_id', ''),
  return_url: get('return_url', null),
})

function submit() {
  if (isEdit) {
    form.put('/admin/payment/' + page.props.model.id)
  } else {
    form.post('/admin/payment')
  }
}
</script>

<template>
  <AppLayout :breadcrumbs="[]">
    <Head :title="isEdit ? 'Edit Payment' : 'Create Payment'" />
    <div class="max-w-xl p-4">
      <form @submit.prevent="submit" class="space-y-8">
        <div class="flex items-center gap-2">
          <label for="payment_id" class="block text-sm font-medium">Payment_id:</label>
          <Input id="payment_id" class="block w-full" v-model="form.payment_id" />
        </div>
        <InputError class="mt-2" :message="form.errors.payment_id" />

        <Button :disabled="form.processing">Save</Button>
      </form>
    </div>
  </AppLayout>
</template>
