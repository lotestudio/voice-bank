<script setup lang="ts">
import { useForm } from '@inertiajs/vue3';
import { ref } from 'vue';
import UserInfo from '@/components/UserInfo.vue';
import { DropdownMenu, DropdownMenuContent, DropdownMenuItem, DropdownMenuTrigger } from '@/components/ui/dropdown-menu';
import { ChevronsUpDown } from 'lucide-vue-next';
import { SidebarMenuButton } from '@/components/ui/sidebar';
import UserMenuContent from '@/components/UserMenuContent.vue';

const props = defineProps({
    order_id: {
        type: Number,
        required: true,
    },
    current_status: {
        type: String,
        required: true,
    },
});

const form = useForm({
    order_id: props.order_id,
    status: '',
});

const loading = ref(false);
const emit = defineEmits(['change']);
const submit = (status: string) => {
    if (status !== '') {
        form.status = status;
        loading.value = true;
        form.post('/admin/order_status/', {
            preserveScroll: true,
            onSuccess: () => {
                loading.value = false;
                emit('change', status);
            },
        });
    }
};

const options = [
    { label: 'accepted', value: 'accepted' },
    { label: 'completed', value: 'completed' },
    { label: 'cancelled', value: 'cancelled' },
    { label: 'refunded', value: 'refunded' },
];
</script>

<template>
    <DropdownMenu>
        <DropdownMenuTrigger as-child>
            <slot/>
        </DropdownMenuTrigger>
        <DropdownMenuContent
            class="w-(--reka-dropdown-menu-trigger-width) min-w-56 rounded-lg"
            align="end"
            :side-offset="4"
        >
            <DropdownMenuItem v-for="option in options"
                              :key="option.value"
                              @click="submit(option.value)"
                              :disabled="option.value === current_status || loading"
            >
                {{option.label}}
            </DropdownMenuItem>
        </DropdownMenuContent>
    </DropdownMenu>
</template>

<style scoped></style>
