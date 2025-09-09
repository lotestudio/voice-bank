<!--<script setup lang="ts">-->
<!--import { Head, useForm, usePage } from '@inertiajs/vue3';-->
<!--import { type BreadcrumbItem } from '@/types';-->
<!--import AppLayout from '@/layouts/AppLayout.vue';-->
<!--import { store,update } from '@/actions/App/Http/Controllers/Lap/VoicesController';-->
<!--import { Button } from '@/components/ui/button';-->
<!--import MultilangInput from '@/components/MultilangInput.vue';-->

<!--import LoteSwitch from '@/components/LoteSwitch.vue';-->
<!--import InputError from '@/components/InputError.vue';-->
<!--import { Input } from '@/components/ui/input';-->
<!--import { VoiceForm, VoiceFormProps } from '@/types/model';-->
<!--import LoteFilePond from '@/components/LoteFilePond.vue';-->
<!--import { useGlobalAudioPlayer } from '@/composables/useGlobalPlayer';-->
<!--import Icon from '@/components/Icon.vue';-->
<!--import LoteSelect from '@/components/LoteSelect.vue';-->


<!--const page = usePage<VoiceFormProps>();-->

<!--const isEditForm = page.props.voice ? true : false;-->
<!--const oldFile = page.props.voice?.file ?? null;-->

<!--const breadcrumbItems: BreadcrumbItem[] = [-->
<!--    {-->
<!--        title: 'Voices List',-->
<!--        href: '/admin/voice',-->
<!--    },-->
<!--    {-->
<!--        title: isEditForm ? (page.props.voice?.name?.bg ?? 'N/A') : 'Create Voice',-->
<!--        href: '',-->
<!--    },-->
<!--];-->


<!--const form = useForm<VoiceForm>({-->
<!--    name: page.props.voice?.name ?? {},-->
<!--    file: page.props.voice?.file ?? null,-->
<!--    description: page.props.voice?.description ?? {},-->
<!--    order: page.props.voice?.order ?? page.props.order,-->
<!--    status: page.props.voice?.status ?? 'ACTIVE',-->
<!--    lang_id:page.props.voice?.status ?? null,-->
<!--    type:page.props.voice?.type ?? null,-->
<!--});-->


<!--const fileUpdated=(e:string)=>{-->
<!--    form.file = e;-->
<!--    if(form.file==='' && oldFile!==null){-->
<!--        form.file = oldFile;-->
<!--    }-->
<!--}-->

<!--const submit = () => {-->
<!--    if (page.props.voice) {-->
<!--        form.submit(update(page.props.voice.id), {-->
<!--            preserveScroll: true-->
<!--        });-->
<!--    } else {-->
<!--        form.submit(store(), {-->
<!--            preserveScroll: true-->
<!--        });-->
<!--    }-->
<!--};-->

<!--const player = useGlobalAudioPlayer();-->

<!--function onPlayPause() {-->
<!--    player.play({-->
<!--        id: page.props.voice?.id ?? 'tmp',-->
<!--        src: '/storage/voices/' + oldFile,-->
<!--        title: 'voice',-->
<!--        artist: 'lap',-->
<!--    });-->
<!--}-->


<!--</script>-->

<!--<template>-->
<!--    <AppLayout :breadcrumbs="breadcrumbItems">-->
<!--        <Head title="Create Voice" />-->
<!--        <div class="max-w-2xl p-4">-->
<!--            <form @submit.prevent="submit" class="space-y-6">-->
<!--                <MultilangInput v-model="form.name" :errors="form.errors" label="Name" as="Input" />-->
<!--                <MultilangInput v-model="form.description" :errors="form.errors" label="Description" as="Textarea" />-->

<!--                <div class="rounded-lg border p-2">-->
<!--                    <div class="flex items-center gap-2">Audio file:-->
<!--                    <span v-if="oldFile" class="font-bold">-->
<!--                        <span :class="{'text-destructive':form.file!==oldFile}">{{oldFile}} <span v-if="oldFile!==form.file">(will be deleted)</span></span>-->
<!--                    </span>-->
<!--                    <div v-if="oldFile">-->
<!--                        <Button type="button" variant="ghost" @click="onPlayPause()" class="rounded border px-2 py-1">-->
<!--                            <Icon v-if="player.state.current?.id === form.id && player.state.isPlaying" name="pause" />-->
<!--                            <Icon v-else name="play" />-->
<!--                        </Button>-->
<!--                    </div>-->
<!--                    </div>-->
<!--                    <LoteFilePond label="Upload Audio file" file_types="audio/*" @update="fileUpdated" ></LoteFilePond>-->
<!--                    <div v-if="form.errors.file" class="text-sm text-red-600 mt-2">{{ form.errors.file }}</div>-->
<!--                </div>-->

<!--                <LoteSelect :options="page.props.langsSelect" @change="form.lang_id=$event"></LoteSelect>-->
<!--                <InputError class="" :message="form.errors.lang_id" />-->
<!--                <LoteSelect :options="page.props.voiceTypeSelect" @change="form.type=$event"></LoteSelect>-->
<!--                <InputError class="" :message="form.errors.type" />-->


<!--                <div class="flex items-center gap-2">-->
<!--                    <label for="order" class="block text-sm font-medium">Order:</label>-->
<!--                    <Input id="order" type="number" class="block w-full" v-model="form.order" />-->
<!--                </div>-->
<!--                <InputError class="" :message="form.errors.order" />-->
<!--                <div class="flex items-center gap-2">-->
<!--                    <label class="block text-sm font-medium">Status:</label>-->
<!--                    <LoteSwitch :default-state="form.status === 'ACTIVE'" @change="form.status = $event ? 'ACTIVE' : 'INACTIVE'" />-->
<!--                </div>-->
<!--                <Button :disabled="form.processing">-->
<!--                    Save-->
<!--                </Button>-->
<!--            </form>-->
<!--        </div>-->
<!--    </AppLayout>-->
<!--</template>-->

<template>---</template>
