<script setup lang="ts">
// import DtHeader from "./DataTable2/dtHeader.vue"
// import DtRow from "./DataTable2/dtRow.vue"
import {computed, onMounted, watch, provide} from "vue"
import Pager from "./DataTable2/Pager.vue"
import {useFilters} from "./DataTable2/composables/useFilters";
import {useDataTableStorage} from "./DataTable2/composables/useDataTableStorage";
import {useColumns} from "./DataTable2/composables/useColumns";
import {useHiddenRows} from "./DataTable2/composables/useHiddenRows";
import {useSelectableRows} from "./DataTable2/composables/useSelectableRows";
import {useActions} from "./DataTable2/composables/useActions";
// import {useDragScroll} from "@/components/DataTable2/composables/useDragScroll";
// import ContextMenu from "@/components/DataTable2/ContextMenu.vue";
import '@@/admin/_loteDataTable2.css';
import { useAjax } from '@/components/DataTable2/composables/useAjax';


const props = defineProps({
    defaultUrl: {
        type: String,
        require: true
    },
    offset: {
        type: Number,
        default: 8
    },

    defaultUrlParams: {
        type: Array,
        default: ()=>[]
    },
    selectable: {
        type: Boolean,
        default: false
    },
    filtersContainerClasses: {
        type: String,
        default: ''
    }
})

const {state, resetState, hardReset, setDefaultUrlParams} = useDataTableStorage(props.defaultUrl, props.defaultUrlParams);
const {filtersCount, setFilter, getFilter} = useFilters(state);
const {toggleColumnVisibility, resetColumnVisibility} = useColumns(state);
const {toggleHiddenRow, selectedHiddenRowsIndexes} = useHiddenRows();
const {ajax, errorMessage, data, loading} = useAjax(state, resetColumnVisibility, props);
const {toggle, selectAll, deselectAll, selected} = useSelectableRows(data, props.selectable)
const {setAction} = useActions(state, ajax, props.defaultUrl);
provide('state', state);

//computed
const rows = computed(() => {
    if (data.value === null) {
        return null;
    }

    return data.value.data;
})

watch(() => state.value.urlParams, () => {
    ajax();
}, {deep: true})

onMounted(() => {
    setDefaultUrlParams();
    ajax();
})

defineExpose({'refresh':ajax});

</script>

<template>
    <div>
        <div
            v-if="$slots.filters"
            :class="filtersContainerClasses"
        >
            <slot name="filters"
                  :columns="state.columns"
                  :urlParams="state.urlParams"
                  :setAction="setAction"
                  :setFilter="setFilter"
                  :getFilter="getFilter"
                  :resetFilters="resetState"
                  :hardReset="hardReset"
                  :columnsVisibility="state.columnsVisibility"
                  :toggleColumnVisibility="toggleColumnVisibility"
                  :resetColumnVisibility="resetColumnVisibility"
                  :total="data?.total"
                  :filtersCount="filtersCount"
            ></slot>
        </div>

        <div v-if="data?.info && $slots.info">
            <slot name="info" :info="data?.info"></slot>
        </div>

<!--        <div v-if="selectable" class="flex items-center justify-between">-->
<!--            <div class="flex items-center space-x-2">-->
<!--                <div v-if="selected.length>0">-->
<!--                    <slot name="selected_action" :selected="selected" :urlParams="state.urlParams"/>-->
<!--                </div>-->
<!--            </div>-->
<!--            <div>-->
<!--                <div class="p-2">Избрани: {{ selected.length }}</div>-->
<!--            </div>-->
<!--        </div>-->


        <div v-if="errorMessage" class="w-full bg-red-100 z-10 p-4 rounded">
            {{ errorMessage }}
        </div>


        <slot
            :items="data"
            :ajax = "ajax"
            :urlParams="state.urlParams"
        >

        </slot>

        <Pager v-if="data!==null && errorMessage===null" :data="data" :offset="offset"
               @change="state.urlParams.page = $event"/>
    </div>
</template>
