<script setup lang="ts">
import { router } from '@inertiajs/vue3';
import { Avatar, AvatarFallback } from '@/components/ui/avatar';
import { Button } from '@/components/ui/button';
import { Progress } from '@/components/ui/progress';
import { useLocale } from '@/composables/useLocale';
import { useGlobalAudioPlayer } from '@/composables/useGlobalPlayer';
import { computed, ref } from 'vue';
import { useGlobalCart } from '@/cartStore';
import { Textarea } from '@/components/ui/textarea';
import LoteAlertDialog from '@/components/LoteAlertDialog.vue';

const props = defineProps({
    artist: {
        type: Object,
        required: true,
    },
});

const { T, t } = useLocale();

const player = useGlobalAudioPlayer();
const currentTrackId = ref(null);

function onPlayPause(voice) {
    currentTrackId.value = voice.id;
    player.play({
        id: currentTrackId.value ?? 'tmp',
        //src: props.voice.sample.url,
        src: '/storage/samples/' + voice.sample.file_url,
        title: voice.title,
        artist: props.artist.name,
    });
}

const progress = computed(() => {
    return player.progress_percent.value(currentTrackId.value ?? 'tmp');
});

const {addNote, getNote, existsInCard, removeVoice} = useGlobalCart();

const voices = computed(()=>{
    return props.artist.voices.filter(voice=>existsInCard(voice.id));
})

</script>

<template>
    <div class="space-y-2 rounded border p-4 dark:border-primary/10 dark:bg-primary/5" v-if="voices.length">
        <div class="flex gap-2 items-center">
            <Avatar class="flex h-10 w-10 cursor-pointer items-center justify-center bg-sidebar-accent">
                <!--                <AvatarImage src="https://github.com/unovue.png" alt="@unovue" />-->
                <AvatarFallback class="text-xs font-bold">{{ artist.user_initials }}</AvatarFallback>
            </Avatar>
            <p>{{ artist.name }}</p>
        </div>

        <div v-for="voice in voices" :key="voice.id" class="space-y-1 rounded border p-4 dark:border-primary/10 dark:bg-primary/5 mt-4">
            <div class="flex items-center gap-2" v-if="voice.sample">
                <Button :key="voice.id" type="button" variant="ghost" size="icon" @click="onPlayPause(voice)" class="rounded-full border px-2 py-1">
                    <span class="i-pause" v-if="player.state.current?.id === voice.id && player.state.isPlaying"></span>
                    <span v-else class="i-play" />
                </Button>
                <p class="text-xs text-gray-500">{{ player.progress_formatted.value(voice.id) }}</p>

                <Progress v-model="progress" class="flex-1" @click="player.seek_click($event, voice.id)" />


                <LoteAlertDialog
                    dialog-title="Remove Voice"
                    dialog-description="Are you sure you want to remove voices from the order?"
                    confirm-label="Remove voice"
                    @confirm="removeVoice(voice.id)"
                >
                    <Button variant ="destructive" size="icon"  class="rounded-full"><span class="i-close"></span></Button>
                </LoteAlertDialog>

            </div>
            <div class="flex items-center gap-2" v-else>
                <div class="rounded border p-2 text-xs text-destructive flex-1">{{ T('no available demo file') }}</div>
                <LoteAlertDialog
                    dialog-title="Remove Voice"
                    dialog-description="Are you sure you want to remove voices from the order?"
                    confirm-label="Remove voice"
                    @confirm="removeVoice(voice.id)"
                >
                    <Button variant ="destructive" size="icon" class="rounded-full"><span class="i-close"></span></Button>
                </LoteAlertDialog>
            </div>
            <div>{{ voice.title }}</div>

            <Textarea :default-value="getNote(voice.id)"
                      class="w-full rounded border p-2 field-sizing-content"
                      placeholder="Voice notes (describe role, intonation...)"
                      @blur="addNote(voice.id,$event.target.value)"
            ></Textarea>
        </div>
    </div>
</template>

<style scoped></style>
