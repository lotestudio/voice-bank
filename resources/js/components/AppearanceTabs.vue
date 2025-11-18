<script setup lang="ts">
import { useAppearance } from '@/composables/useAppearance';


const { appearance, updateAppearance } = useAppearance();

const tabs = [
    { value: 'light', icon: 'i-sun', label: 'Light' },
    { value: 'dark', icon: 'i-moon', label: 'Dark' },
    { value: 'system', icon: 'i-monitor', label: 'Auto' },
] as const;
</script>

<template>
    <div class="inline-flex gap-1 rounded-lg bg-muted p-1">
        <button
            v-for="{ value, icon, label } in tabs"
            :key="value"
            @click="updateAppearance(value)"
            :class="[
                'flex items-center rounded-md px-3.5 py-1.5 transition-colors w-1/3',
                appearance === value
                    ? 'bg-background shadow-xs dark:bg-stone-700 dark:text-stone-100'
                    : 'text-stone-500 hover:bg-sidebar-accent hover:text-black dark:text-stone-400 dark:hover:bg-stone-700/60',
            ]"
        >
            <span :class="icon"></span>
            <span class="ml-1.5 text-sm">{{ label }}</span>
        </button>
    </div>
</template>
