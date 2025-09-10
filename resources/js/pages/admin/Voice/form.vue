<script setup lang="ts">
import { Head, useForm, usePage } from '@inertiajs/vue3'
import AppLayout from '@/layouts/AppLayout.vue'
import { Input } from '@/components/ui/input';
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';
import MultilangInput from '@/components/MultilangInput.vue';


const page = usePage()
const isEdit = !!page.props.model
const form = useForm({
  title: page.props.model?.title ?? ''
})

function submit() {
  if (isEdit) {
    form.put('/admin/voice/' + page.props.model.id)
  } else {
    form.post('/admin/voice')
  }
}
</script>

<template>
  <AppLayout :breadcrumbs="[]">
    <Head :title="isEdit ? 'Edit Voice' : 'Create Voice'" />
    <div class="max-w-xl p-4">
      <form @submit.prevent="submit" class="space-y-4">
        <MultilangInput v-model="form.title" :errors="form.errors" label="Title" as="Input" />
        <Button :disabled="form.processing">Save</Button>
      </form>
    </div>
  </AppLayout>
</template>
