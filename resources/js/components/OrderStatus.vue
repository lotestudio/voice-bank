<script setup lang="ts">
defineProps({
    status: {
        type: String,
        required: true,
    },
    label: {
        type: String,
        required: true,
    },
});

const statusStyle = {
    pending: 'border-yellow-500/20 text-yellow-500 bg-yellow-500/10',
    accepted: 'border-blue-500/20 text-blue-500 bg-blue-500/10',
    in_progress: 'border-purple-500/20 text-purple-500 bg-purple-500/10',
    completed: 'border-green-500/20 text-green-500 bg-green-500/10',
    cancelled: 'border-red-500/20 text-red-500 bg-red-500/10',
    refunded: 'border-gray-500/20 text-gray-500 bg-gray-500/10',
};
</script>

<template>
    <div :class="statusStyle[status]" class="rounded border px-2 py-1 text-sm">{{ label }}</div>
</template>

<style scoped></style>
