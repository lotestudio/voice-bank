<script setup lang="ts">
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar';
import { ref } from 'vue';
import axios from 'axios';
import { toast } from 'vue-sonner';
import { Button } from '@/components/ui/button';

const props = defineProps({
    fallback_text: {
        type: String,
        required: true,
    },
    avatar_url: {
        type: [String, null],
    },
    post_data: {
        type: Object,
        default: () => ({}),
    },
    show_remove_button: {
        type: Boolean,
        default: false,
    },
    post_url: {
        type: String,
        default: '/avatar_upload',
    },
});

const src_url = ref(props.avatar_url);
const loading = ref(false);

const handleFileInputChange = async (event: Event) => {
    const fileInput = event.target as HTMLInputElement;
    if (fileInput.files && fileInput.files.length > 0) {
        const file = fileInput.files[0];
        src_url.value = URL.createObjectURL(file);

        const formData = new FormData();
        formData.append('avatar', file);

        await sendRequest(formData);
    }
};

const removePhoto = async () => {
    src_url.value = null;
    await sendRequest(new FormData());
};

const sendRequest = async (formData: FormData) => {
    loading.value = true;

    Object.keys(props.post_data).forEach((key) => formData.append(key, props.post_data[key]));

    try {
        await axios
            .post(props.post_url, formData, {
                headers: {
                    'Content-Type': 'multipart/form-data',
                },
            })
            .then((response) => {
                toast.success(response.data.message);
                loading.value = false;
            });
    } catch (error) {
        toast.error('Error uploading avatar:' + error.toString());
        loading.value = false;
    }
};
</script>

<template>
    <div class="flex flex-col gap-4">
        <Avatar
            class="flex aspect-square h-auto w-full cursor-pointer items-center justify-center bg-sidebar-accent"
            @click="loading ? null : $refs.fileInput.click()"
        >
            <AvatarImage :src="src_url ?? ''" :alt="fallback_text" class="object-cover" />
            <AvatarFallback>
                <div class="flex flex-col items-center gap-2">
                    <span class="i-image_plus"></span>
                    <p class="font-bold">{{fallback_text}}</p>
                </div>
            </AvatarFallback>
        </Avatar>
        <input type="file" :disabled="loading" @change="handleFileInputChange($event)" ref="fileInput" class="hidden" />

        <Button :disabled="loading" v-if="show_remove_button && src_url" @click="removePhoto">Remove photo</Button>
    </div>
</template>

<style scoped></style>
