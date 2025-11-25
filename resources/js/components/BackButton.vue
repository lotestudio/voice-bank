<script setup lang="ts">
import { router } from '@inertiajs/vue3';
import { Button } from '@/components/ui/button';
import { useLocale } from '@/composables/useLocale';

defineProps({
    variant: {
        type: String as () => 'default' | 'destructive' | 'outline' | 'secondary' | 'ghost' | 'link',
        default: 'ghost',
    },
    hasIcon: {
        type: Boolean,
        default: true,
    },
});

const goBack = () => {
    if (window.history.length > 1) {
        window.history.back();
    } else {
        router.visit(route('dashboard'));
    }
};

const { T } = useLocale();
</script>

<template>
    <Button :variant="variant" @click="goBack" :class="hasIcon ? 'gap-0' : ''">
        <span class="i-chevronLeft" v-if="hasIcon"></span>{{ T('back') }}
    </Button>
</template>
