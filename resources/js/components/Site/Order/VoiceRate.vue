<template>
    <div class="flex items-center gap-2">
        <div>Rate this voice:</div>
        <StarRating v-model="form.rating" @change="onChange" :max="5" label="Ad voice rating" />
    </div>
</template>

<script setup>
import StarRating from '@/components/StarRating.vue';
import { store, update } from '@/routes/reviews/index.ts';
import { useForm } from '@inertiajs/vue3';
import { computed} from 'vue';

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
    rating: review.value?.rating ?? 0,
    voice_id: props.voice_id,
    order_id: props.order_id,
});

function onChange() {
    if (props.review) {
        form.put(update.url(props.review.id), {});
    } else if (props.voice_id && props.order_id) {
        form.post(store.url(), {
            preserveScroll: true,
            onSuccess: () => {},
        });
    }
}
</script>
