<template>
    <div>
        <div class="flex items-center gap-2">
            <div>Review:</div>
            <Textarea v-model="form.comment" class="field-sizing-content"/>
        </div>
        <div class="flex justify-end gap-2 mt-4">
            <Button variant="destructive" size="sm" @click="updateComment(true)">Delete</Button>
            <Button  size="sm" @click="updateComment()">Save</Button>
        </div>
    </div>
</template>

<script setup>
import { store, update } from '@/routes/reviews/index.ts';
import { useForm } from '@inertiajs/vue3';
import { computed} from 'vue';
import { Textarea } from '@/components/ui/textarea/index.ts';
import { useLocale } from '@/composables/useLocale';
import { toast } from 'vue-sonner';
import { Button } from '@/components/ui/button/index.ts';

const { locale } = useLocale();

const props = defineProps({
    review: {
        type: Object,
        default: null,
    },
    voice_id: {
        type: Number,
        default: null,
    },
    order_id: {
        type: Number,
        default: null,
    },
});

const review = computed(() => props.review);

const form = useForm({
    comment: review.value?.comment[locale] ?? null,
    voice_id: props.voice_id,
    order_id: props.order_id,
});


const updateComment = (reset = false) => {

    if(reset){
        form.comment='';
    }

    if (props.review) {
        form.put(update.url(props.review.id), {
            onSuccess: () => {
                toast.success('Comment saved!')
            },
        });
    } else if (props.voice_id && props.order_id) {
        form.post(store.url(), {
            preserveScroll: true,
            onSuccess: () => {
                toast.success('Comment saved!')
            },
        });
    }
}


</script>
