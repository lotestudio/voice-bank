<script setup lang="ts">
import { computed, onMounted, ref } from 'vue';
import { router } from '@inertiajs/vue3';
import SortController from '@/actions/App/Http/Controllers/Admin/SortController';
import { toast } from 'vue-sonner';
import { SlickList, SlickItem } from 'vue-slicksort';
import { Button } from '@/components/ui/button';
import LoteSwitch from '@/components/LoteSwitch.vue';
import SampleController from '@/actions/App/Http/Controllers/Admin/SampleController';
import LoteAlertDialog from '@/components/LoteAlertDialog.vue';

const props = defineProps<{ voice: any }>();

const items = ref([]);
const sorted_items = computed(() => {
    return items.value.map((item, index) => {
        const res = {};
        res['id'] = item.id;
        res['sort_order'] = index + 1;

        return res;
    });
});

const saveSorting = () => {
    router.post(
        SortController.store().url,
        {
            model: 'sample',
            order_column: 'sort_order',
            items: sorted_items.value,
        },
        {
            preserveScroll: true,
            onSuccess: () => {
                toast.success('Items reordered successfully.');
            },
        },
    );
};


const deleteSample = (id: number) => {
    router.delete(SampleController.destroy(id).url, {
        preserveScroll: true,
        onSuccess: () => {
            items.value = items.value.filter((item) => item.id !== id);
            toast.success('The Sample has been deleted successfully.');
        },
    });
};


onMounted(() => {
    if (props.voice) {
        items.value = props.voice.samples;
    } else {

    }
});
</script>
<template>
    <div class="">
        <SlickList axis="y"
                   v-model:list="items" c
                   class="space-y-2"
                   @update:list="saveSorting"
                   helperClass="!z-[9999] transition-none"
                   :distance="5"
                   :transitionDuration="0"
        >
            <SlickItem v-for="(item, i) in items" :key="item.id" :index="i" class="rounded bg-secondary-foreground p-2 text-black select-none">
                <div class="flex justify-between items-center">
                    <div>{{ i + 1 }}. {{ item.title.en }}</div>
                    <div class="flex gap-2 items-center" @mousedown.stop @touchstart.stop>
                        <LoteSwitch :default-state="item.is_featured" :url="'/admin/sample/' + item.id + '/toggle-featured'" />
                        <LoteAlertDialog
                            trigger-variant="destructive"
                            trigger-label="trash"
                            is-icon
                            dialog-title="Delete Sample"
                            dialog-description="Are you sure you want to delete this Sample?"
                            confirm-label="Delete"
                            @confirm="deleteSample(item.id)"
                        >
                            <Button variant="destructive" size="icon">
                                <span class="i-trash"></span>
                            </Button>
                        </LoteAlertDialog>

                    </div>
                </div>
            </SlickItem>
        </SlickList>
    </div>
</template>

<style scoped></style>
