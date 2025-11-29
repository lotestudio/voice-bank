<script setup lang="ts">
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar';
import { Button } from '@/components/ui/button';
import { Progress } from '@/components/ui/progress';
import { useGlobalAudioPlayer } from '@/composables/useGlobalPlayer';
import { useLocale } from '@/composables/useLocale';
import { router } from '@inertiajs/vue3';
import { computed } from 'vue';
import VoiceRate from '@/components/Site/Order/VoiceRate.vue';
import VoiceReview from '@/components/Site/Order/VoiceReview.vue';

const props = defineProps({
    voice: {
        type: Object,
        required: true,
    },
    review: {
        type: Object,
        default:null
    },
    order_id: {
        type: Number,
        required:true
    }
});

const { T, locale } = useLocale();

const player = useGlobalAudioPlayer();

function onPlayPause() {
    player.play({
        id: props.voice.id ?? 'tmp',
        //src: props.voice.sample.url,
        src: '/storage/samples/' + props.voice.sample.file_url,
        title: props.voice.title,
        artist: props.voice.user.name,
    });
}

const progress = computed(() => {
    return player.progress_percent.value(props.voice.id);
});

const title = computed(() => {
    return typeof props.voice.title === 'object' ? props.voice.title[locale] : props.voice.title;
});

</script>

<template>
    <div class="space-y-4 rounded border p-4 dark:border-primary/10 dark:bg-primary/5">
        <div class="lg:flex gap-2">
            <div class="flex gap-2 lg:mb-0 mb-4">
                <Avatar
                    class="flex h-10 w-10 cursor-pointer items-center justify-center bg-sidebar-accent"
                    @click="router.visit('artist/' + voice.user.id)"
                >
                    <AvatarImage :src="voice.user.avatar.url" alt="voice.user.avatar.initials" />
                    <AvatarFallback class="text-xs font-bold">{{ voice.user.avatar.initials }}</AvatarFallback>
                </Avatar>

                <div class="space-y-1">
                    <a :href="'artist/' + voice.user.id">{{ voice.user.name }}</a>
                    <p class="text-xs">{{ title }}</p>
                </div>
            </div>

            <div class="flex items-center gap-2" v-if="voice.sample">
                <Button :key="voice.id" type="button" variant="ghost" size="icon" @click="onPlayPause()" class="rounded-full border px-2 py-1">
                    <span class="i-pause" v-if="player.state.current?.id === voice.id && player.state.isPlaying"></span>
                    <span v-else class="i-play" />
                </Button>
                <p class="text-xs text-gray-500">{{ player.progress_formatted.value(voice.id) }}</p>

                <Progress v-model="progress" class="flex-1" @click="player.seek_click($event, voice.id)" />

                <div>
                    <Button
                        as="a"
                        :href="'/sample/download/' + voice.sample.id"
                        variant="ghost"
                        size="icon"
                        class="rounded-full border px-2 py-1 text-foreground"
                    >
                        <span class="i-download"></span>
                    </Button>
                </div>
            </div>

            <div v-else class="flex-1 flex items-center rounded border p-2 text-xs text-destructive">{{ T('no available demo file') }}</div>
        </div>
        <VoiceRate :review="review" :order_id="order_id" :voice_id="voice.id"></VoiceRate>
        <VoiceReview :review="review" :order_id="order_id" :voice_id="voice.id"></VoiceReview>

    </div>
</template>

<style scoped></style>
