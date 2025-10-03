<script setup lang="ts">
import {
    AlertDialog,
    // AlertDialogAction,
    AlertDialogCancel,
    AlertDialogContent,
    AlertDialogDescription,
    AlertDialogFooter,
    AlertDialogHeader,
    AlertDialogTitle,
    AlertDialogTrigger,
} from '@/components/ui/alert-dialog';
import { Button } from '@/components/ui/button';
import Icon from '@/components/Icon.vue';

defineProps({
    cancelLabel: {
        type: String,
        default: 'Cancel',
    },
    confirmVariant: {
        type: Button['variant'],
        default: 'destructive',
    },
    confirmLabel: {
        type: String,
        default: 'Continue',
    },
    dialogTitle: {
        type: String,
        default: 'Are you absolutely sure?',
    },
    dialogDescription: {
        type: String,
        default: 'This action cannot be undone. This will permanently delete your account and remove your data from our servers.',
    },
});

const emit = defineEmits(['confirm', 'cancel']);
</script>

<template>
    <AlertDialog>
        <AlertDialogTrigger as-child>
            <slot/>
        </AlertDialogTrigger>
        <AlertDialogContent>
            <AlertDialogHeader>
                <AlertDialogTitle>{{ dialogTitle }}</AlertDialogTitle>
                <AlertDialogDescription>
                    {{ dialogDescription }}
                </AlertDialogDescription>
            </AlertDialogHeader>
            <AlertDialogFooter>
                <AlertDialogCancel @click="emit('cancel')">{{ cancelLabel }}</AlertDialogCancel>
                <Button @click="emit('confirm')" :variant="confirmVariant">
                    {{ confirmLabel }}
                </Button>
            </AlertDialogFooter>
        </AlertDialogContent>
    </AlertDialog>
</template>
