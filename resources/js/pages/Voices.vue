<script setup lang="ts">
import { Head, usePage } from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import VoiceGrid from '@/components/Site/VoiceGrid.vue';
import { Input } from '@/components/ui/input';
import ResetButton from '@/components/DataTable2/Inertia/ResetButton.vue';
import DataList from '@/components/DataList.vue';
import LoteSelect from '@/components/LoteSelect.vue';
import LoteSheet from '@/components/ui/sheet/LoteSheet.vue';
import { Button } from '@/components/ui/button';
import LoteToggleGroup from '@/components/LoteToggleGroup.vue';

const page = usePage();
const locale = page.props.locale;


</script>

<template>
    <Head title="Welcome">
    </Head>
    <SiteLayout>
        <div class="container mx-auto mt-10 px-8">
            <data-list default-url="voices" class="flex flex-col gap-6">
                <template #filters="filterProps">
                    <div class="my-4">
                        <div class="grid md:grid-cols-[repeat(auto-fit,minmax(200px,1fr))] gap-2">
                            <div>
                                <Input
                                    class="w-full border shadow-none"
                                    placeholder="търси"
                                    v-model="filterProps.urlParams.search"
                                    @keyup.enter="filterProps.setFilter()">
                                    ></Input>
                            </div>
                            <div v-for="feature in page.props.featured_filters" :key="feature.id"
                                 :class="filterProps.getFilter('feature_'+feature.name) ? 'bg-primary rounded ring-2 ring-primary': ''"
                            >
                                <lote-select
                                    :options="feature.valuesForSelect"
                                    width_class="w-full"
                                    :selected="filterProps.getFilter('feature_'+feature.name) || ''"
                                    @change="filterProps.setFilter('feature_'+feature.name,$event)"
                                ></lote-select>
                            </div>
                            <div class="flex gap-2 w-full">
                                <lote-sheet side="right" content_classes="w-lg px-4">
                                    <template #trigger>
                                        <div class="relative">
                                            <div
                                                v-if="filterProps.filtersCount>0"
                                                class="absolute -top-3 -right-2 bg-destructive text-white rounded-full size-6 text-xs grid place-content-center"
                                            >{{filterProps.filtersCount}}
                                            </div>
                                            <Button class="flex-1" variant="secondary">Всички филтри</Button>
                                        </div>
                                    </template>
                                    <div class="w-full max-h-[calc(100vh-100px)] overflow-y-auto">
                                        <div class="container mx-auto max-w-lg space-y-2 mb-40">
                                            <div v-for="feature in page.props.featured_filters" :key="feature.id" class="flex gap-2 items-center">
                                                <div class="w-60 text-sm">{{feature.display_name[locale]}}:</div>
                                                <div
                                                    class="w-full"
                                                    :class="filterProps.getFilter('feature_'+feature.name) ? 'bg-primary rounded ring-2 ring-primary': ''"
                                                >
                                                    <lote-select
                                                        :options="feature.valuesForSelect"
                                                        width_class="w-full"
                                                        :selected="filterProps.getFilter('feature_'+feature.id) || ''"
                                                        @change="filterProps.setFilter('feature_'+feature.id,$event)"
                                                    ></lote-select>
                                                </div>
                                            </div>
                                            <div v-for="filter in page.props.filters" :key="filter.id" class="flex gap-2 items-start">
                                                <div class="w-60 h-9 flex items-center text-sm">{{filter.display_name[locale]}}:</div>
                                                <div class="w-full">
                                                    <LoteToggleGroup :options="filter.valuesForSelect" class="block"
                                                                     :selected="filterProps.getFilter('feature_'+filter.id) || ''"
                                                                     @update:selected="filterProps.setFilter('feature_'+filter.id,$event)"
                                                    ></LoteToggleGroup>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                </lote-sheet>
                                <ResetButton @click.stop.prevent="filterProps.resetFilters()"></ResetButton>
                            </div>
                        </div>
                    </div>
                </template>
                <template #default="{items,ajax,urlParams}">
                    <VoiceGrid v-if="items" :data="items"></VoiceGrid>
                </template>
            </data-list>
        </div>
    </SiteLayout>
</template>
