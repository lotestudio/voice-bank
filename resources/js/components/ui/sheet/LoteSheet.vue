<script setup lang="ts">
import {
    Sheet,
    SheetClose,
    SheetContent,
    SheetDescription,
    SheetFooter,
    SheetHeader,
    SheetTitle,
    SheetTrigger,
} from '@/components/ui/sheet'
import { ref } from 'vue';
import { Button } from '@/components/ui/button';

type SheetSide = 'top' | 'bottom' | 'left' | 'right'

defineProps({
    side:{
        type: String as PropType<SheetSide>,
        default: 'right',
        validator: (value: string): value is SheetSide => {
            return ['top', 'bottom', 'left', 'right'].includes(value)
        }
    },
    content_classes:String,
})


const isOpen = ref(false);

const close = ()=>{
    isOpen.value = false;
}

</script>

<template>
    <Sheet v-model:open="isOpen">
        <SheetTrigger as-child>
            <slot name="trigger"/>
        </SheetTrigger>
        <SheetContent :side="side" :class="content_classes">
            <SheetHeader>
                <SheetTitle><slot name="title"/></SheetTitle>
                <SheetDescription>
                    <slot name="description"/>
                </SheetDescription>
            </SheetHeader>
            <slot :close="close"/>
            <SheetFooter>
                <slot name="footer" :close="close"/>
            </SheetFooter>
        </SheetContent>
    </Sheet>
</template>
