<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import LoteSelect from '@/components/LoteSelect.vue';
import MultilangInput from '@/components/MultilangInput.vue';
import { Button } from '@/components/ui/button';
import { useGlobalAudioPlayer } from '@/composables/useGlobalPlayer';
import AppLayout from '@/layouts/AppLayout.vue';
import { Head, useForm, usePage } from '@inertiajs/vue3';
import LoteFilePond from '@/components/LoteFilePond.vue';
import LoteSwitch from '@/components/LoteSwitch.vue';
import {useInitialValue} from '@/composables/useInitialFormValue';

const page = usePage();
const { get, isEdit, model } = useInitialValue();
const oldFile = model?.file_url ?? null;

const form = useForm({
    id: get('id', 'tmp'),
    title: get('title', {}, 'json'),
    voice_id: get('voice_id', null, 'number'), // Автоматично хваща ?voice_id=5
    file_url: get('file_url', null),
    is_featured: get('is_featured', false, 'boolean'),
    description: get('description', {}, 'json'),
    return_url: get('return_url', null),
});


const fileUpdated = (e: string) => {
    form.file_url = e;
    if (form.file_url === '' && oldFile !== null) {
        form.file_url = oldFile;
    }
};

function submit() {
    if (isEdit) {
        form.put('/admin/sample/' + page.props.model.id);
    } else {
        form.post('/admin/sample');
    }
}

const player = useGlobalAudioPlayer();

function onPlayPause() {
    player.play({
        id: page.props.model?.id ?? 'tmp',
        src: '/storage/samples/' + oldFile,
        title: 'voice',
        artist: 'lap',
    });
}
</script>

<template>
    <AppLayout :breadcrumbs="[]">
        <Head :title="isEdit ? 'Edit Sample' : 'Create Sample'" />
        <div class="max-w-xl p-4">
            <form @submit.prevent="submit" class="space-y-8">
                <div class="rounded-lg border p-2">
                    <div class="flex items-center gap-2">
                        <span v-if="oldFile" class="font-bold">
                            <span :class="{ 'text-destructive': form.file_url !== oldFile }"
                                >{{ oldFile }} <span v-if="oldFile !== form.file_url">(will be deleted)</span></span
                            >
                        </span>
                        <div v-if="oldFile">
                            <Button type="button" variant="ghost" @click="onPlayPause()" class="rounded border px-2 py-1">
                                <span  v-if="player.state.current?.id === form.id && player.state.isPlaying" class="i-pause" />
                                <span v-else class="i-play" />
                            </Button>
                        </div>
                    </div>
                    <LoteFilePond label="Upload Audio file" file_types="audio/*" @update="fileUpdated"></LoteFilePond>
                    <div v-if="form.errors.file_url" class="mt-2 text-center text-sm text-red-600">{{ form.errors.file_url }}</div>
                </div>

                <div class="flex items-center gap-2">
                    <label class="block text-sm font-medium">Voice:</label>
                    <LoteSelect
                        width_class="w-full"
                        :options="page.props.voices"
                        :selected="form.voice_id"
                        @change="form.voice_id = $event"
                    ></LoteSelect>
                </div>
                <InputError :message="form.errors.voice_id" />

                <MultilangInput v-model="form.title" :errors="form.errors" label="Title" as="Input" />

                <MultilangInput v-model="form.description" :errors="form.errors" label="Description"  as="Textarea"/>

                <div class="flex items-center gap-2">
                    <label class="block text-sm font-medium">Is featured:</label>
                    <LoteSwitch :default-state="form.is_featured" @change="form.is_featured = $event" />
                </div>

                <Button :disabled="form.processing">Save</Button>
            </form>
        </div>
    </AppLayout>
</template>
