<script setup lang="ts">

import { useGlobalAudioPlayer } from '@/composables/useGlobalPlayer';
import { computed } from 'vue';
import { Progress } from '@/components/ui/progress';
import { Button } from '@/components/ui/button';

const props = defineProps({
   'id':String,
   'url':String
});

const player = useGlobalAudioPlayer();

const progress = computed(() => {
    return player.progress_percent.value(props.id);
});

function onPlayPause() {
    player.play({
        id: props.id ?? 'tmp',
        src: '/storage/samples/' + props.url,
        title: 'voice',
        artist: 'lap',
    });
}
</script>

<template>
    <div class="flex items-center gap-2">
        <Button
            type="button"
            variant="ghost"
            @click="onPlayPause()"
            class="rounded border px-2 py-1"
        >
            <span v-if="player.state.current?.id === id && player.state.isPlaying" class="i-pause" />
            <span v-else class="i-play" />
        </Button>
        <p class="text-xs text-gray-500">{{ player.progress_formatted.value(id) }}</p>
        <Progress v-model="progress" class="min-w-full flex-1" @click="player.seek_click($event, id)" />
    </div>
</template>

<style scoped></style>
