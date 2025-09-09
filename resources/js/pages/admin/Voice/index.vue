<!--<script setup lang="ts">-->
<!--import { Head, Link } from '@inertiajs/vue3';-->
<!--import { type BreadcrumbItem } from '@/types';-->
<!--import AppLayout from '@/layouts/AppLayout.vue';-->

<!--import voicesController from '@/actions/App/Http/Controllers/Lap/VoicesController';-->
<!--import DtTd from '@/components/DataTable2/dtTd.vue';-->
<!--import DataTable2 from '@/components/DataTable2.vue';-->
<!--import LoteSelect from '@/components/LoteSelect.vue';-->
<!--import ResetButton from '@/components/DataTable2/Inertia/ResetButton.vue';-->
<!--import LoteSwitch from '@/components/LoteSwitch.vue';-->
<!--import { Button } from '@/components/ui/button';-->
<!--import VoicesController from '@/actions/App/Http/Controllers/Lap/VoicesController';-->
<!--import { router } from '@inertiajs/vue3';-->
<!--import { ref } from 'vue';-->
<!--import Icon from '@/components/Icon.vue';-->
<!--import { useGlobalAudioPlayer } from '@/composables/useGlobalPlayer';-->
<!--import { toast } from 'vue-sonner';-->
<!--import LoteAlertDialog from '@/components/LoteAlertDialog.vue';-->

<!--defineProps({-->
<!--    langsSelect:{-->
<!--        type:Array,-->
<!--    }-->
<!--})-->

<!--const breadcrumbItems: BreadcrumbItem[] = [-->
<!--    {-->
<!--        title: 'Voices List',-->
<!--        href: '/admin/voice',-->
<!--    },-->
<!--];-->

<!--const dataTable = ref<InstanceType<typeof DataTable2>>();-->
<!--const player = useGlobalAudioPlayer();-->



<!--function onPlayPause(voice) {-->
<!--    player.play({-->
<!--        id: voice.id,-->
<!--        src: '/storage/voices/'+voice.file,-->
<!--        title: voice.name,-->
<!--        artist: voice.name,-->
<!--    });-->
<!--}-->


<!--const deleteVoice = (id: number) => {-->
<!--    router.delete(VoicesController.destroy(id).url, {-->
<!--        preserveScroll: true,-->
<!--        onSuccess: () => {-->
<!--            if (!dataTable.value) return;-->
<!--            dataTable.value.refresh();-->
<!--            toast.success('The Voice has been deleted successfully.')-->
<!--        },-->
<!--    });-->
<!--}-->



<!--</script>-->

<!--<template>-->
<!--    <AppLayout :breadcrumbs="breadcrumbItems">-->
<!--        <Head title="Demos List" />-->
<!--        <div class="p-6">-->
<!--            <div class="p-4">-->

<!--                <data-table2 :default-url="voicesController.index.url()" drag-scroll ref="dataTable">-->
<!--                    <template #filters="filterProps">-->
<!--                        <div class="flex items-center justify-between gap-2 w-full">-->
<!--                            <div class="flex gap-2">-->
<!--                                <LoteSelect :options="langsSelect" @change="filterProps.setFilter('lang_id',$event)" :selected="filterProps.getFilter('lang_id') ?? null"></LoteSelect>-->
<!--                                <ResetButton @click.stop.prevent="filterProps.resetFilters()"></ResetButton>-->
<!--                            </div>-->
<!--                            <Link :href="voicesController.create.url()">-->
<!--                                <Button>New Voice</Button>-->
<!--                            </Link>-->
<!--                        </div>-->
<!--                    </template>-->
<!--                    <template v-slot:tr="trProps">-->
<!--                        <dt-td column="0">-->
<!--                            <div class="flex gap-2 items-center">-->
<!--                                <div>-->
<!--                                    <button variant="ghost" @click="onPlayPause(trProps.row)" class="px-2 py-1 rounded border">-->
<!--                                        <Icon v-if="player.state.current?.id===trProps.row.id && player.state.isPlaying" name="pause" />-->
<!--                                        <Icon v-else name="play"/>-->
<!--                                    </button>-->
<!--                                </div>-->
<!--                                <div>-->
<!--                                    {{trProps.row.name}}-->
<!--                                    <br>-->
<!--                                    <span class="text-xs">{{trProps.row.file}}</span>-->
<!--                                </div>-->
<!--                            </div>-->

<!--                        </dt-td>-->
<!--                        <dt-td column="1">-->
<!--                            <LoteSwitch-->
<!--                                :default-state="trProps.row.status==='ACTIVE'"-->
<!--                                :url="'/admin/voice/'+trProps.row.id+'/toggle-status'"-->
<!--                            />-->
<!--                        </dt-td>-->
<!--                        <dt-td column="2">-->
<!--                            {{trProps.row.order}}-->
<!--                        </dt-td>-->
<!--                        <dt-td column="3">-->
<!--                            {{trProps.row.lang}}-->
<!--                        </dt-td>-->
<!--                        <dt-td column="4">-->
<!--                            <div class="flex gap-2 justify-end">-->
<!--                                <Button variant="secondary" @click="router.visit(VoicesController.edit(trProps.row.id))">-->
<!--                                    <Icon name="edit" />-->
<!--                                </Button>-->
<!--                                <LoteAlertDialog-->
<!--                                    trigger-variant="destructive"-->
<!--                                    trigger-label="trash"-->
<!--                                    is-icon-->
<!--                                    dialog-title="Delete Voice"-->
<!--                                    dialog-description="Are you sure you want to delete this voice?"-->
<!--                                    confirm-label="Delete"-->
<!--                                    @confirm="deleteVoice(trProps.row.id)"-->
<!--                                >-->
<!--                                </LoteAlertDialog>-->
<!--                            </div>-->
<!--                        </dt-td>-->
<!--                    </template>-->
<!--                </data-table2>-->
<!--            </div>-->

<!--        </div>-->
<!--    </AppLayout>-->
<!--</template>-->

<template>
    <div class="p-6">In dev</div>
</template>
