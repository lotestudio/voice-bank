<script setup lang="ts">
import { Button } from '@/components/ui/button';
import { Calendar } from '@/components/ui/calendar';
import { Popover, PopoverContent, PopoverTrigger } from '@/components/ui/popover';
import { cn } from '@/lib/utils';
import type { DateValue } from '@internationalized/date';
import { getLocalTimeZone, parseDate, today } from '@internationalized/date';
import { computed, Ref, ref } from 'vue';

const props = defineProps({
    initial_date: {
        type: [String, null],
        default: null,
    },
    placeholder: {
        type: String,
        default: 'Pick a date',
    },
});

const defaultPlaceholder = today(getLocalTimeZone());

const date = ref(props.initial_date ? parseDate(props.initial_date) : undefined) as Ref<DateValue | undefined>;

const emit = defineEmits(['change']);

const emitChange = () => {
    if (date.value) {
        emit('change', dateFormatter.value);
    } else {
        emit('change', null);
    }
};

const dateFormatter = computed(() => {
    if (date.value) {
        return date.value.year + '-' + date.value.month + '-' + date.value.day;
    }
    return props.placeholder;
});
</script>

<template>
    <Popover v-slot="{ close }">
        <PopoverTrigger as-child>
            <Button variant="outline" :class="cn('w-full justify-start text-left font-normal', !date && 'text-muted-foreground')">
                <span class="i-calendar"></span>
                {{ dateFormatter }}
            </Button>
        </PopoverTrigger>
        <PopoverContent class="w-auto p-0" align="start">
            <Calendar
                v-model="date"
                :default-placeholder="defaultPlaceholder"
                @update:model-value="
                    () => {
                        close;
                        emitChange();
                    }
                "
            />
        </PopoverContent>
    </Popover>
</template>
