<script setup lang="ts">
import { Head} from '@inertiajs/vue3';
import SiteLayout from '@/layouts/SiteLayout.vue';
import { Input } from '@/components/ui/input';
import ResetButton from '@/components/DataTable2/Inertia/ResetButton.vue';
import DataList from '@/components/DataList.vue';
import VoiceGrid from '@/components/Site/VoiceGrid.vue';
</script>

<template>
    <Head title="Welcome">
    </Head>
    <SiteLayout>
        <div class="container mx-auto mt-10 px-8">
            <h1 class="font-bold text-3xl">DataList Test</h1>
            <data-list :default-url="'/dev/data-list-test'" class="flex flex-col gap-6">
                <template #filters="filterProps">
                    <div class="flex gap-2 w-full my-4">
                        <Input
                            class="w-40 border-neutral-300 dark:border-neutral-500 shadow-none"
                            placeholder="търси"
                            v-model="filterProps.urlParams.search"
                            @keyup.enter="filterProps.setFilter()">
                            ></Input>
                        <ResetButton @click.stop.prevent="filterProps.resetFilters()"></ResetButton>
                    </div>
                </template>
                <template #default="{items,ajax,urlParams}">
                    <VoiceGrid v-if="items" :data="items"></VoiceGrid>
                </template>
            </data-list>
        </div>
    </SiteLayout>
</template>
