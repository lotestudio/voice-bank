<template>
    <app-layout>
        <Head>
            <title>Contacts</title>
            <meta name="description" content="Lap Voice Over - Full Voice Over Services" />
        </Head>
        <!--    <h2 class="text-6xl font-bold text-gray-400 text-center mb-4">{{T('contacts',locale)}}</h2>-->
        <div v-if="page.props.flash.message !== 'success'" class="mx-auto max-w-sm text-xl mt-6 lg:mt-18 space-y-2">
            <div class="flex items-center justify-center">
                <span class="i-mobile"></span>
            </div>
            <div class="flex items-center justify-center">
                +359 898 989 614
            </div>
            <p class="text-center text-sm text-muted-foreground">
                <span v-if="locale === 'bg'"> Обадете се или изпратете съобщение </span>
                <span v-if="locale === 'en'"> Call us or send a message: </span>
            </p>
        </div>

        <form
            v-if="page.props.flash.message !== 'success'"
            @submit.prevent="submit"
            class="mt-8 mb-8 flex w-full max-w-sm flex-col gap-6 mx-auto md:mt-0 md:py-8 px-4"
        >
            <div class="grid gap-2">
                <Label for="name">{{ T('name', locale) }}</Label>
                <Input
                    id="name"
                    type="text"
                    required
                    autofocus
                    :tabindex="1"
                    autocomplete="name"
                    v-model="form.name"
                    placeholder="Full name"
                />
                <InputError :message="form.errors.email" />
            </div>
            <div class="grid gap-2">
                <Label for="email">Email address</Label>
                <Input
                    id="email"
                    type="email"
                    :tabindex="2"
                    autocomplete="email"
                    v-model="form.email"
                    placeholder="email@example.com"
                />
                <InputError :message="form.errors.email" />
            </div>

            <div class="grid gap-2">
                <Label for="message">{{ T('message', locale) }}</Label>
                <Textarea
                    v-model="form.message"
                    id="message"
                    name="message"
                    class="h-32"
                ></Textarea>
                <InputError :message="form.errors.message" />
            </div>
            <Button type="submit" size="lg" class="mt-4">{{ T('send', locale) }}</Button>
        </form>

        <div v-else class="mx-auto mt-6 lg:mt-16 mb-4 max-w-sm text-center text-xl">
            <div v-if="locale === 'en'">
                <h2 class="mb-4 text-center text-2xl font-bold">Thank you for getting in touch!</h2>

                <p class="mb-2">
                    We appreciate you contacting us. <br />
                    One of our colleagues will get back in touch with you soon!
                </p>

                <p>Have a great day!</p>
            </div>
            <div v-else>
                <h2 class="mb-4 text-center text-2xl font-bold">Благодарим Ви, че влязохте във връзка с нас!</h2>

                <p class="mb-2">Ще се свържем с Вас възможно най-скоро!</p>

                <p>Хубав ден!</p>
            </div>
        </div>
    </app-layout>
</template>

<script setup>
import AppLayout from '@/layouts/SiteLayout.vue';
import { usePage, Head, useForm } from '@inertiajs/vue3';
import { useLocale } from '@/composables/useLocale.js';
import { ref } from 'vue';
import { Button } from '@/components/ui/button/index.js';
import { Label } from '@/components/ui/label/index.js';
import { Input } from '@/components/ui/input/index.js';
import InputError from '@/components/InputError.vue';
import { Textarea } from '@/components/ui/textarea/index.js';

const page = usePage();
const { T } = useLocale();

defineProps({
    response_message: String,
});

const locale = ref(page.props.locale);

const form = useForm({
    name: null,
    email: '',
    message: '',
});

function submit() {
    form.post('/send');
}
</script>

<style scoped></style>
