<script setup lang="ts">
import { usePage } from '@inertiajs/vue3';
import { Avatar, AvatarImage, AvatarFallback } from '@/components/ui/avatar';
import Icon from '@/components/Icon.vue';
import { Button } from '@/components/ui/button';
import { useGlobalAudioPlayer } from '@/composables/useGlobalPlayer';
import { Progress } from '@/components/ui/progress';
import { computed, ref } from 'vue';

const props = defineProps({
    voice: Object,
});

const player = useGlobalAudioPlayer();

function onPlayPause() {
    player.play({
        id: props.voice?.id ?? 'tmp',
        //src: props.voice?.sample.url,
        src: '/storage/samples/sample.mp3',
        title: props.voice?.title,
        artist: props.voice?.user.name,
    });
}

const progress = computed(() => {
    return player.progress.value*100;
});
</script>

<template>
    <div class="space-y-2 rounded border p-2">
        <div class="flex gap-2">
            <Avatar class="flex h-10 w-10 items-center justify-center bg-sidebar-accent">
                <!--            <AvatarImage src="https://github.com/unovue.png" alt="@unovue" />-->
                <AvatarFallback class="text-xs font-bold">{{ voice?.user_initials }}</AvatarFallback>
            </Avatar>
            <div>
                <p>{{ voice?.user.name }}</p>
                <p class="text-xs">{{ voice?.title }}</p>
            </div>
        </div>

        <div class="flex items-center gap-2" v-if="voice.sample">
            <Button :key="voice.id" type="button" variant="ghost" size="icon" @click="onPlayPause()" class="rounded-full border px-2 py-1">
                <Icon v-if="player.state.current?.id === voice?.id && player.state.isPlaying" name="pause" />
                <Icon v-else name="play" />
            </Button>
            <p>{{ voice.sample?.duration }}</p>

            <Progress v-model="progress" class="flex-1" />

            <div>ddd</div>
        </div>
    </div>
</template>

<style scoped></style>
