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

import {ChevronsDownUp} from 'lucide-vue-next';

import { onMounted, ref, computed, nextTick, watch } from "vue";

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
        default: 'N/A'
    },
    notFoundValueClass: {
        type: String,
        default: 'text-danger-500',
    },
    doNotShowChevrons:{
        type: Boolean,
        default: false
    },
    listBoxButtonClass: {
        type: String,
        default: 'defaultListBoxButtonClass'
    }
});

// Reactive reference for the selected value
const selectedRef = ref(null);
const emit = defineEmits(['change']);

const update = (event) => {
    nextTick(() => {
        emit('change', event ?? '');
    })
}

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
    selectedRef.value = filteredOptions.value.find(
        (option) => option.value === props.selected
    )?.value ?? null;

    isMounted.value = true;
});

const selectedLabel = computed(() => {
    let sl= filteredOptions.value.find(option => option.value === selectedRef.value)?.label ?? props.notFoundValueLabel
    return sl;
})

//Chek if props.selected is changed after mounting. TODO::NOT TESTED
watch(() => props.selected, (newVal, oldVal) => {
    if (isMounted.value) {
        selectedRef.value = props.selected==='' ? null : props.selected;
    }
});

</script>
<template>
    <SelectRoot
        v-model="selectedRef"
        :name="name"
        @update:modelValue="update"
    >

        <SelectTrigger
            :class="[props.width_class,props.listBoxButtonClass]"
        >
            <SelectValue class="block truncate">
                {{ selectedLabel }}
            </SelectValue>
            <SelectIcon v-if="!props.doNotShowChevrons" as-child>
                <ChevronsDownUp size="16"/>
            </SelectIcon>
        </SelectTrigger>

        <SelectPortal>
            <SelectContent
                class="bg-background text-sm p-2 border rounded-lg shadow-sm min-w-[160px] z-[100]"
            >
                <SelectScrollUpButton
                    class="flex items-center justify-center rounded-b-lg h-[25px] bg-background cursor-default">
                    <span class="i-angleUp"></span>
                </SelectScrollUpButton>
                <SelectViewport class="p-1">
                    <SelectItem
                        v-for="(option, index) in filteredOptions"
                        :key="option.value"
                        :value="option.value"
                        class="cursor-pointer outline-none block hover:bg-accent p-2 rounded"
                        :title="option.label"
                    >
                        <SelectItemIndicator
                            class="absolute left-0 w-[25px] inline-flex items-center justify-center">
                            <span class="i-check"></span>
                        </SelectItemIndicator>
                        <SelectItemText>{{ option.label }}</SelectItemText>
                    </SelectItem>
                </SelectViewport>
                <SelectScrollDownButton
                    class="flex items-center justify-center rounded-b-lg h-[25px] bg-background cursor-default">
                    <span class="i-angleDown"></span>
                </SelectScrollDownButton>
                <SelectArrow/>
            </SelectContent>
        </SelectPortal>
    </SelectRoot>
</template>

<style scoped>

@reference "@@/app.css";

.defaultListBoxButtonClass{
    @apply relative py-2 px-3 flex items-center justify-between
    bg-background rounded-lg shadow-md
    cursor-default
    focus:outline-none
    border text-sm
}
</style>
