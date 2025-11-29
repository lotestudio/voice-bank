<script setup lang="ts">
import { Textarea } from '@/components/ui/textarea';
import { computed} from 'vue';
import { usePage } from '@inertiajs/vue3';

const {artist_count} = defineProps({
    artist_count: {
        type: Number,
        default: 1,
    },
    textarea_id: {
        type:String,
        default: 'order-calculator-textarea-id',
    }
});

const content = defineModel({default: ''})

const word_count = computed(() => {
    return content.value.split(/\s+/).filter((word) => word.length > 0).length;
});

const {single_word_price, single_artist_price} = usePage().props.price_calculator;
const total = computed(() => {
    return `€${(word_count.value * single_word_price)+(artist_count*single_artist_price)}`;
});

const translations = usePage().props.order_calculator_translations ?? {};
const t = (key: string) => translations[key] ?? key;
</script>

<template>
    <div>
        <Textarea class="field-sizing-content" :id="textarea_id" v-model="content"></Textarea>
        <div class="grid grid-cols-2 md:grid-cols-3 mt-4 gap-4">

            <div class="p-2 bg-secondary-foreground border rounded-md">
                <div class="flex">
                    <div class="w-2/3">
                        <p class="text-xs font-bold">{{t('number_of_voices')}}</p>
                        <p class="text-xs">{{t('price_per_voice')}}: €{{single_artist_price}}</p>
                    </div>
                    <div class="w-1/3 flex justify-center items-center">
                        <p class="font-bold text-center">{{ artist_count }}</p>
                    </div>
                </div>
            </div>
            <div class="p-2 bg-secondary-foreground border rounded-md">
                <div class="flex">
                    <div class="w-2/3">
                        <p class="text-xs font-bold">{{t('word_count')}}</p>
                        <p class="text-xs">{{t('price_per_word')}}: €{{single_word_price}}</p>
                    </div>
                    <div class="w-1/3 flex justify-center items-center">
                        <p class="font-bold">{{ word_count }}</p>
                    </div>
                </div>
            </div>
            <div class="p-2 bg-secondary-foreground border rounded-md col-span-2 md:col-span-1">
                <div class="flex">
                    <div class="w-2/3">
                        <p class="text-xs font-bold">{{t('total_price')}}</p>
                        <p class="text-xs">{{t('approximate')}}</p>
                    </div>
                    <div class="w-1/3 flex justify-center items-center">
                        <p class="font-bold">{{ total }}</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="my-4 text-center text-xs">{{t('total_price_alert')}}</div>
    </div>
</template>
