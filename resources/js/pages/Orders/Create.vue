<script setup lang="ts">
import InputError from '@/components/InputError.vue';
import Artist from '@/components/Site/Artist.vue';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import SiteLayout from '@/layouts/SiteLayout.vue';
import { Head, Link, router, useForm } from '@inertiajs/vue3';
import { Textarea } from '@/components/ui/textarea';
import { Button } from '@/components/ui/button';
import { useLocale } from '@/composables/useLocale';
import { useGlobalCart } from '@/cartStore';
import LoteAlertDialog from '@/components/LoteAlertDialog.vue';
import LoteDatePicker from '@/components/LoteDatePicker.vue';
import { watch } from 'vue';
import { store, create } from '@/routes/orders';
import OrderCalculator from '@/pages/Home/OrderCalculator.vue';
import { TabsContent, TabsList, TabsRoot, TabsTrigger } from 'reka-ui';

const { clearVoices, voices, order, clearOrder } = useGlobalCart();

const form = useForm({
    title: order.value.title,
    description: order.value.description,
    script_text: order.value.script_text,
    deadline: order.value.deadline,
});

watch(form, (newVal) => {
    console.log(newVal.deadline);
    Object.assign(order.value, {
        title: newVal.title,
        description: newVal.description,
        script_text: newVal.script_text,
        deadline: newVal.deadline,
    });
});

const { T, locale_url } = useLocale();

const submit = () => {

    form.transform((data) => ({
        ...data,
        voices: Array.from(voices.value, ([voice, note]) => ({
            voice_id: voice,
            artist_notes: note,
        })),
    })).post(store.url());
};

const reset_form = () => {
    clearOrder();
    router.visit(create.url());
};
</script>

<template>
    <SiteLayout>
        <Head title="Create" />

        <div class="container mx-auto mt-10 max-w-4xl space-y-10 px-8">
            <h1 class="text-3xl font-bold">{{ T('complete_order') }}</h1>

            <TabsRoot default-value="details" v-slot="{ modelValue }" >
                <TabsList class="mb-2 flex gap-1 border-b">
                    <TabsTrigger class="outline-none" value="details">
                        <button
                            type="button"
                            :class="[
                                'flex items-center px-3.5 py-1.5 text-xs transition-colors',
                                modelValue === 'details'
                                    ? 'border-b-2 border-neutral-500 dark:text-neutral-100'
                                    : 'border-b-2 border-transparent text-neutral-500 hover:text-black dark:text-neutral-400 dark:hover:text-white',
                            ]"
                        >
                            {{ T('order_details') }}
                        </button>
                    </TabsTrigger>
                    <TabsTrigger class="outline-none" value="voices">
                        <button
                            type="button"
                            :class="[
                                'flex items-center px-3.5 py-1.5 text-xs transition-colors',
                                modelValue === 'voices'
                                    ? 'border-b-2 border-neutral-500 dark:text-neutral-100'
                                    : 'border-b-2 border-transparent text-neutral-500 hover:text-black dark:text-neutral-400 dark:hover:text-white',
                            ]"
                        >
                            <div class="flex items-center gap-2">
                                {{ T('chosen_voices') }} ({{voices.size ?? 0}})
                            </div>
                        </button>
                    </TabsTrigger>
                </TabsList>
                <TabsContent value="details" force-mount :hidden="modelValue !== 'details'">
                    <div class="space-y-2 rounded border p-4 dark:border-primary/10 dark:bg-primary/5 mt-6">
                        <form @submit.prevent="submit" class="space-y-6">
                            <div class="grid grid-cols-1 gap-2 space-y-4 md:grid-cols-2 md:space-y-0">
                                <div class="grid gap-2">
                                    <Label for="title">{{ T('project_title') }}</Label>
                                    <Input id="title" class="block w-full" v-model="form.title" required autocomplete="name" />
                                    <InputError class="mt-2" :message="form.errors.title" />
                                </div>
                                <div class="grid gap-2">
                                    <Label for="script">{{ T('deadline') }}</Label>
                                    <LoteDatePicker :initial_date="form.deadline" @change="form.deadline = $event" :placeholder="T('pick_a_date')" />
                                    <InputError class="mt-2" :message="form.errors.deadline" />
                                </div>
                            </div>

                            <div class="grid gap-2">
                                <Label for="description">{{ T('project_description') }}</Label>
                                <Textarea
                                    id="description"
                                    class="block field-sizing-content w-full"
                                    v-model="form.description"
                                    required
                                    autocomplete="name"
                                />
                                <InputError class="mt-2" :message="form.errors.description" />
                            </div>
                            <div class="grid gap-2">
                                <Label for="script_text">{{ T('project_script') }}</Label>
                                <OrderCalculator
                                    textarea_id="script_text"
                                    class="block w-full"
                                    v-model="form.script_text"
                                    :artist_count="voices.size ?? 1"
                                ></OrderCalculator>
                                <InputError class="mt-2" :message="form.errors.script_text" />
                            </div>
                        </form>
                    </div>
                </TabsContent>
                <TabsContent value="voices" force-mount :hidden="modelValue !== 'voices'">
                    <div class="space-y-6 mt-6" v-if="voices.size">
                        <div class="flex items-center justify-end">
                            <LoteAlertDialog
                                :dialog-title="T('remove_voices')"
                                :dialog-description="T('are_you_sure_remove_all_voices')"
                                :confirm-label="T('clear_voices')"
                                :cancel-label="T('cancel')"
                                @confirm="clearVoices"
                            >
                                <Button variant="link"  size="sm" class="text-xs text-destructive">
                                    {{ T('clear_all_voices') }}
                                </Button>
                            </LoteAlertDialog>
                        </div>
                        <Artist :artist="artist" v-for="artist in $page.props.artists" :key="artist.id" />

                        <div class="text-center">
                            <Button as-child variant="ghost">
                                <Link :href="locale_url('voices')" class="hover:no-underline"> <span class="i-plus"></span>{{ T('add_more_voices') }} </Link>
                            </Button>
                        </div>
                    </div>

                    <div class="text-center" v-else>
                        <Button as-child>
                            <Link :href="locale_url('voices')">{{ T('add_voices') }}</Link>
                        </Button>
                    </div>
                </TabsContent>
            </TabsRoot>



            <InputError class="mt-2" :message="form.errors.voices" />

            <hr />
            <div class="flex items-center justify-between" v-if="voices.size">
                <Button @click="reset_form" variant="destructive">{{ T('reset_order') }}</Button>
                <Button @click="submit">{{ T('send') }}</Button>
            </div>
        </div>
    </SiteLayout>
</template>
