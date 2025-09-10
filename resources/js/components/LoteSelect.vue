<script setup>
import {
    SelectArrow,
    SelectContent,
    SelectIcon,
    SelectItem,
    SelectItemIndicator,
    SelectItemText,
    SelectPortal,
    SelectRoot,
    SelectScrollDownButton,
    SelectScrollUpButton,
    SelectTrigger,
    SelectValue,
    SelectViewport,
} from 'reka-ui';

import { ChevronsUpDown } from 'lucide-vue-next';

import { computed, nextTick, onMounted, ref, watch } from 'vue';

const props = defineProps({
    options: {
        type: Array,
        required: true,
    },
    selected: {
        type: [String, Number],
        default: null,
    },
    width_class: {
        type: String,
        default: 'w-72',
    },
    // @deprecated
    dropdown_width_class: {
        type: String,
        default: null,
    },
    name: {
        type: String,
        default: null,
    },
    notFoundValueLabel: {
        type: String,
        default: 'N/A',
    },
    notFoundValueClass: {
        type: String,
        default: 'text-danger-500',
    },
    doNotShowChevrons: {
        type: Boolean,
        default: false,
    },
    listBoxButtonClass: {
        type: String,
        default: 'defaultListBoxButtonClass',
    },
});

// Reactive reference for the selected value
const selectedRef = ref(null);
const emit = defineEmits(['change']);

const update = (event) => {
    nextTick(() => {
        emit('change', event ?? '');
    });
};

// Preprocess the option array: remove empty value
const filteredOptions = computed(() => {
    return props.options.map((option) => {
        if (option.value === '') {
            option.value = null;
        }
        return option;
    });
});

const isMounted = ref(false);

// Set the initial value for selectedRef on mount
onMounted(() => {
    selectedRef.value = filteredOptions.value.find((option) => option.value === props.selected)?.value ?? null;

    isMounted.value = true;
});

const selectedLabel = computed(() => {
    let sl = filteredOptions.value.find((option) => option.value === selectedRef.value)?.label ?? props.notFoundValueLabel;
    return sl;
});

//Chek if props.selected is changed after mounting. TODO::NOT TESTED
watch(
    () => props.selected,
    (newVal, oldVal) => {
        if (isMounted.value) {
            selectedRef.value = props.selected === '' ? null : props.selected;
        }
    },
);
</script>
<template>
    <SelectRoot v-model="selectedRef" :name="name" @update:modelValue="update">
        <SelectTrigger :class="[props.width_class, props.listBoxButtonClass]">
            <SelectValue class="block truncate">
                {{ selectedLabel }}
            </SelectValue>
            <SelectIcon v-if="!props.doNotShowChevrons" as-child>
                <ChevronsUpDown size="16" />
            </SelectIcon>
        </SelectTrigger>

        <SelectPortal>
            <SelectContent class="z-[100] min-w-[160px] rounded-lg border bg-background p-2 text-sm shadow-sm">
                <SelectScrollUpButton class="flex h-[25px] cursor-default items-center justify-center rounded-b-lg bg-background">
                    <span class="i-angleUp"></span>
                </SelectScrollUpButton>
                <SelectViewport class="p-1">
                    <SelectItem
                        v-for="(option, index) in filteredOptions"
                        :key="option.value"
                        :value="option.value"
                        class="block cursor-pointer rounded p-2 outline-none hover:bg-accent"
                        :title="option.label"
                    >
                        <SelectItemIndicator class="absolute left-0 inline-flex w-[25px] items-center justify-center">
                            <span class="i-check"></span>
                        </SelectItemIndicator>
                        <SelectItemText>{{ option.label }}</SelectItemText>
                    </SelectItem>
                </SelectViewport>
                <SelectScrollDownButton class="flex h-[25px] cursor-default items-center justify-center rounded-b-lg bg-background">
                    <span class="i-angleDown"></span>
                </SelectScrollDownButton>
                <SelectArrow />
            </SelectContent>
        </SelectPortal>
    </SelectRoot>
</template>

<style scoped>
@reference "@@/app.css";

.defaultListBoxButtonClass {
    @apply relative flex cursor-default items-center justify-between rounded-md bg-background px-3 py-2 text-sm outline outline-offset-[-1px] outline-border focus:outline-none;
}
</style>
