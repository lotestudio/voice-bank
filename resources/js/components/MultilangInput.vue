<script setup lang="ts">
import { TabsContent, TabsList, TabsRoot, TabsTrigger } from 'reka-ui';
import { Input } from '@/components/ui/input';
import InputError from '@/components/InputError.vue';
import { TranslatableField } from '@/types/model';
import { Textarea } from '@/components/ui/textarea';
import { defineAsyncComponent } from 'vue';


const RichText = defineAsyncComponent(() =>
    import('@/components/RichText.vue')
)

// import InputError from '@/components/InputError.vue';
const props = defineProps({
    defaultLang: {
        type: String,
        default: 'bg',
    },
    label: {
        type: String,
        required: true,
    },
    errors: {
        type: Object,
        default: () => {},
    },
    fieldName: {
        type: String,
        default: null,
    },
    as: {
        type: String,
        required: true,
        validator: (value: string) => ['Input', 'Textarea', 'RichText'].includes(value),
    },
});

const field = defineModel<TranslatableField>({
    default: () => ({
        bg: '',
        en: '',
    }),
});

const languages = ['bg', 'en'];

const getError = (lang: string): string|undefined => {
    const fieldName = props.fieldName || props.label.toLowerCase();

    if(props.errors[fieldName]){
        return props.errors[fieldName];
    }

    return props.errors[`${fieldName}.${lang}`] ?? undefined;

};

const InputComponent = {
    Input: Input,
    Textarea: Textarea,
    RichText: RichText,
}[props.as];
</script>

<template>
    <TabsRoot :default-value="languages.indexOf(defaultLang)" v-slot="{ modelValue }" class="rounded-lg border p-2">
        <div class="px-1 text-sm">{{ label }}</div>

        <TabsList class="mb-2 flex gap-1 border-b">
            <TabsTrigger class="outline-none" :value="index" v-for="(lang, index) in languages" :key="lang">
                <button
                    type="button"
                    :class="[
                        'flex items-center px-3.5 py-1.5 text-xs transition-colors',
                        modelValue === index
                            ? 'border-b-2 border-neutral-500 dark:text-neutral-100'
                            : 'border-b-2 border-transparent text-neutral-500 hover:text-black dark:text-neutral-400 dark:hover:text-white',
                    ]"
                >
                    <span class="uppercase" :class="{ 'text-destructive': getError(lang) }">{{ lang }}</span>
                </button>
            </TabsTrigger>
            <TabsTrigger class="outline-none" :value="languages.length">
                <button
                    type="button"
                    :class="[
                        'flex items-center px-3.5 py-1.5 text-xs transition-colors',
                        modelValue === languages.length
                            ? 'border-b-2 border-neutral-500 dark:text-neutral-100'
                            : 'border-b-2 border-transparent text-neutral-500 hover:text-black dark:text-neutral-400 dark:hover:text-white',
                    ]"
                >
                    ALL
                </button>
            </TabsTrigger>
        </TabsList>
        <TabsContent v-for="(lang, index) in languages" :key="lang" :value="lang" force-mount :hidden="modelValue !== index">
            <component
                :is="InputComponent"
                class="mt-1 block w-full"
                v-model="field[lang]"
                :placeholder="label+' '+lang"
            />
            <InputError class="mt-2" :message="getError(lang)" />
        </TabsContent>
        <TabsContent :hidden="modelValue !== languages.length" force-mount key="all" value="all">
            <div class="space-y-2" v-for="lang in languages" :key="lang">
                <component
                    :is="InputComponent"
                    class="mt-1 block w-full"
                    v-model="field[lang]"
                    :placeholder="label+' '+lang"
                />
                <InputError class="mt-2" :message="getError(lang)" />
            </div>
        </TabsContent>
    </TabsRoot>
</template>

<style scoped></style>
