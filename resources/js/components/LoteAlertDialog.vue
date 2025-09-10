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
    triggerLabel: {
        type: String,
        default: 'Show Dialog',
    },
    triggerVariant: {
        type: Button['variant'],
        default: 'outline',
    },
    isIcon: {
        type: Boolean,
        default: false,
    },
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
            <Button :variant="triggerVariant">
                <Icon :name="triggerLabel" v-if="isIcon"/>
                <span v-else>{{ triggerLabel }}</span>
            </Button>
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
