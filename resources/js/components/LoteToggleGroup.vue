<script setup lang="ts">
import { ToggleGroup, ToggleGroupItem } from '@/components/ui/toggle-group';
import { onMounted, ref, watch } from 'vue';

const props = defineProps({
    options: [Array, Object],
    type: {
        type: String as () => 'single' | 'multiple',
        default: 'multiple',
    },
    selected: {
        type: [Array, String],
    },
    variant: {
        type: String as () => 'outline' | 'default',
        default: 'outline',
    },
});

const modelValue = ref(props.selected);

const emit = defineEmits(['update:selected']);

watch(
    () => props.selected,
    (newValue) => {
        modelValue.value = newValue;
    },
);

onMounted(() => {
    modelValue.value = props.selected;
});
</script>

<template>
    <ToggleGroup :type="type" :variant="variant" v-model="modelValue" @update:modelValue="(val) => emit('update:selected', val)">
        <ToggleGroupItem v-for="option in options" :value="option.value" :key="option.value" class="m-1 border-none">
            {{ option.label }}
        </ToggleGroupItem>
    </ToggleGroup>
</template>
