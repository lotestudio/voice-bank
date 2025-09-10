<script setup lang="ts">
import { Button } from '@/components/ui/button';
import { Sheet, SheetClose, SheetContent, SheetDescription, SheetFooter, SheetHeader, SheetTitle, SheetTrigger } from '@/components/ui/sheet';
import { PropType } from 'vue';

const SHEET_SIDES = ["top", "right", "bottom", "left"] as const

defineProps({
    sheetTitle: {
        type: String,
        default: null,
    },
    sheetDescription: {
        type: String,
        default: null,
    },
    triggerVariant: {
        type: Button['variant'] as PropType<Button['variant']>,
        default: 'default',
    },
    triggerLabel: {
        type: String,
        default: 'Show sheet',
    },
    isIcon: {
        type: Boolean,
        default: false,
    },
    side: {
        type: String as PropType<typeof SHEET_SIDES[number]>,
        default: 'right',
    },
    contentClasses: {
        type: String,
        default: 'max-w-sm',
    },
});




</script>

<template>
    <Sheet>
        <SheetTrigger as-child>
            <Button :variant="triggerVariant">
                <Icon :name="triggerLabel" v-if="isIcon" />
                <span v-else>{{ triggerLabel }}</span>
            </Button>
        </SheetTrigger>
        <SheetContent :side="side" :class="contentClasses">
            <SheetHeader>
                <SheetTitle>{{ sheetTitle }}</SheetTitle>
                <SheetDescription>
                    {{ sheetDescription }}
                </SheetDescription>
            </SheetHeader>
            <slot></slot>
            <SheetFooter>
<!--                <SheetClose as-child>-->
<!--                    <Button type="submit"> Save changes </Button>-->
<!--                </SheetClose>-->

                <slot name="footer"></slot>
            </SheetFooter>
        </SheetContent>
    </Sheet>
</template>
