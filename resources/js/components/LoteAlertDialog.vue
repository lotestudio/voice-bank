<script setup lang="ts">
import {
    AlertDialog,
    AlertDialogAction,
    AlertDialogCancel,
    AlertDialogContent,
    AlertDialogDescription,
    AlertDialogFooter,
    AlertDialogHeader,
    AlertDialogTitle,
    AlertDialogTrigger,
} from '@/components/ui/alert-dialog';
import { Button } from '@/components/ui/button';
import { ref } from 'vue';

const props=defineProps({
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
    autoOpen: {
        type: Boolean,
        default: false,
    },
    closeOnly:{
        type: Boolean,
        default: false,
    }
});

const emit = defineEmits(['confirm', 'cancel']);
const open = ref(props.autoOpen);

const onConfirm = () => {
    emit('confirm');
    open.value = false; // close programmatically
};

</script>

<template>
    <AlertDialog v-model:open="open">
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

                <AlertDialogCancel v-if="!closeOnly" @click="emit('cancel')">{{ cancelLabel }}</AlertDialogCancel>
                <Button @click="onConfirm" :variant="confirmVariant">
                    {{confirmLabel}}
                </Button>

            </AlertDialogFooter>
        </AlertDialogContent>
    </AlertDialog>
</template>
