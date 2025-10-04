<script setup>
import {computed} from "vue";
import { Button } from '@/components/ui/button/index.js';

import { ChevronLeft, ChevronRight } from 'lucide-vue-next';

const props = defineProps({
    data: {
        type: Object,
        default:null
    },
    offset:{
        type:Number,
        require: true
    }
})

const emit = defineEmits(['change']);

const pageNumbers = computed(() => {
    if (!props.data.to) {
        return [];
    }
    let from = props.data.current_page - props.offset;
    if (from < 1) {
        from = 1;
    }
    let to = from + (props.offset * 2);
    if (to >= props.data.last_page) {
        to = props.data.last_page;
    }

    let pagesArray = [];
    for (let page = from; page <= to; page++) {
        pagesArray.push(page);
    }
    return pagesArray;
})

const changePage = (page) => {
    emit('change',page);
}


</script>

<template>
    <div class="loteDataTablePager"
         v-if="data!==null && pageNumbers.length>1">
        <Button
            size="sm"
            variant="outline"
            :disabled = "! (data.current_page > 1)"
             aria-label="Previous"
             v-on:click.prevent="changePage(data.current_page - 1)">
            <ChevronLeft class="w-4 h-4"></ChevronLeft>
        </Button>
        <Button
            size="sm"
            :variant="data.current_page===page ?  'default' : 'outline'"
             v-on:click.prevent="changePage(page)"
             v-for="page in pageNumbers"
            :key="page"
        >
            {{ page }}
        </Button>
        <Button
            size="sm"
            variant="outline"
            v-if="data.current_page < data.last_page"
             aria-label="Next"
             v-on:click.prevent="changePage(data.current_page + 1)"
        >
            <ChevronRight class="w-4 h-4"></ChevronRight>
        </Button>
    </div>
</template>
