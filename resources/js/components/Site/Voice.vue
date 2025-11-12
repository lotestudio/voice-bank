<script setup lang="ts">
import { Avatar, AvatarFallback } from '@/components/ui/avatar';
import { Button } from '@/components/ui/button';
import { useGlobalAudioPlayer } from '@/composables/useGlobalPlayer';
import { Progress } from '@/components/ui/progress';
import { computed } from 'vue';
import { useLocale } from '@/composables/useLocale';
import { router } from '@inertiajs/vue3';

const props = defineProps({
    voice: {
        type: Object,
        required: true,
    },
});

const { T, t } = useLocale();

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
</script>

<template>
    <div class="space-y-2 rounded border p-4 dark:border-primary/10 dark:bg-primary/5">
        <div class="flex gap-2">
            <Avatar
                class="flex h-10 w-10 cursor-pointer items-center justify-center bg-sidebar-accent"
                @click="router.visit('artist/' + voice.user.id)"
            >
                <!--                <AvatarImage src="https://github.com/unovue.png" alt="@unovue" />-->
                <AvatarFallback class="text-xs font-bold">{{ voice.user_initials }}</AvatarFallback>
            </Avatar>

            <div class="space-y-1">
                <a :href="'artist/' + voice.user.id">{{ voice.user.name }}</a>
                <p class="text-xs">{{ voice.title }}</p>
                <p class="flex items-center gap-1 text-xs">
                    {{ voice.rating }} <span class="i-star text-orange-400"></span> {{ t('from') }} {{ voice.orders_count }} {{ t('orders') }}
                    <span class="i-heart text-red-500"></span>
                    {{ voice.favorites_count }}
                </p>
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

        <div v-else class="rounded border p-2 text-xs text-destructive">{{ T('no available demo file') }}</div>

        <div class="flex items-center justify-between">
            <div class="text-xs">{{ T('artist_status') }}: {{ voice.availability }}</div>

            <div>
                <Button>{{ T('order') }}</Button>
            </div>
        </div>
    </div>
</template>

<style scoped></style>
