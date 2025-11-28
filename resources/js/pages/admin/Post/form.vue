<script setup lang="ts">
import { Head, useForm, usePage } from '@inertiajs/vue3'
import AppLayout from '@/layouts/AppLayout.vue'
import { Input } from '@/components/ui/input';
import InputError from '@/components/InputError.vue';
import { Button } from '@/components/ui/button';
import MultilangInput from '@/components/MultilangInput.vue';
import LoteSwitch from '@/components/LoteSwitch.vue';
import {store, update} from '@/actions/App/Http/Controllers/Admin/PostController';
import {useInitialValue} from '@/composables/useInitialFormValue';

const page = usePage()
const { get, isEdit } = useInitialValue();

const form = useForm({
    title: get('title', {}, 'json'),
    body: get('body', {}, 'json'),
    excerpt: get('excerpt', {}, 'json'),
    position: get('position', 0, 'number'),
    section: get('section', ''),
    is_published: get('is_published', true, 'boolean'),
    return_url: get('return_url', null),
});

function submit() {
  if (isEdit) {
      form.submit(update(page.props.model.id), {
          preserveScroll: true
      });
  } else {
      form.submit(store(), {
          preserveScroll: true
      });
  }
}

</script>

<template>
  <AppLayout :breadcrumbs="[]">
    <Head :title="isEdit ? 'Edit Post' : 'Create Post'" />
    <div class="max-w-xl p-4">
      <form @submit.prevent="submit" class="space-y-8">
          <MultilangInput v-model="form.title" :errors="form.errors" label="Title"  as="Input"/>
          <MultilangInput v-model="form.excerpt" :errors="form.errors" label="Excerpt"  as="Textarea"/>
          <MultilangInput v-model="form.body" :errors="form.errors" label="Body"  as="RichText"/>
          <div class="flex items-center gap-2">
              <label for="section" class="block text-sm font-medium">Section:</label>
              <Input id="section" type="text" class="block w-full" v-model="form.section" />
          </div>
          <InputError class="mt-2" :message="form.errors.section" />
          <div class="flex items-center gap-2">
              <label for="position" class="block text-sm font-medium">Position:</label>
              <Input id="position" type="number" class="block w-full" v-model="form.position" />
          </div>
          <InputError class="mt-2" :message="form.errors.position" />
          <div class="flex items-center gap-2">
              <label class="block text-sm font-medium">Status:</label>
              <LoteSwitch :default-state="form.is_published" @change="form.is_published = $event" />
          </div>
          <InputError class="mt-2" :message="form.errors.is_published" />
          <Button :disabled="form.processing">Save</Button>
      </form>
    </div>
  </AppLayout>
</template>
