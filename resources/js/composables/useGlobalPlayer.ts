// resources/js/composables/useGlobalAudioPlayer.ts
import { reactive, computed, onBeforeUnmount } from 'vue';

type Track = {
    id: string | number;
    src: string;        // absolute or relative URL
    title?: string;
    artist?: string;
    cover?: string;
    meta?: Record<string, unknown>;
};

type PlayerState = {
    current?: Track;
    isPlaying: boolean;
    duration: number;     // seconds
    currentTime: number;  // seconds
    volume: number;       // 0..1
    muted: boolean;
    canPlay: boolean;
    loading: boolean;
    error?: string;
};

let audio: HTMLAudioElement | null = null;
let listenersAttached = false;

const state = reactive<PlayerState>({
    current: undefined,
    isPlaying: false,
    duration: 0,
    currentTime: 0,
    volume: 1,
    muted: false,
    canPlay: false,
    loading: false,
    error: undefined,
});

function ensureAudio() {
    if (!audio) {
        audio = new Audio();
        audio.preload = 'metadata';
        audio.crossOrigin = 'anonymous'; // if you need waveform/visualizer or CORS assets
        audio.volume = state.volume;
        audio.muted = state.muted;
    }
    if (!listenersAttached && audio) {
        listenersAttached = true;
        audio.addEventListener('loadedmetadata', () => {
            state.duration = isFinite(audio!.duration) ? audio!.duration : 0;
            state.loading = false;
            state.canPlay = true;
        });
        audio.addEventListener('timeupdate', () => {
            state.currentTime = audio!.currentTime || 0;
        });
        audio.addEventListener('play', () => {
            state.isPlaying = true;
            state.error = undefined;
        });
        audio.addEventListener('pause', () => {
            state.isPlaying = false;
        });
        audio.addEventListener('ended', () => {
            state.isPlaying = false;
            // Auto-advance logic could go here if you add a queue
        });
        audio.addEventListener('waiting', () => {
            state.loading = true;
        });
        audio.addEventListener('canplay', () => {
            state.loading = false;
            state.canPlay = true;
        });
        audio.addEventListener('error', () => {
            state.loading = false;
            state.error = 'Playback error';
            state.isPlaying = false;
        });
    }
}

async function play(track: Track) {
    ensureAudio();

    if (!audio) return;

    const isNew = !state.current || state.current.src !== track.src;

    try {
        if (isNew) {
            // Pause any existing audio first to guarantee only one at a time
            if (!audio.paused) audio.pause();

            state.loading = true;
            state.canPlay = false;
            state.error = undefined;
            state.duration = 0;
            state.currentTime = 0;

            audio.src = track.src;
            state.current = track;

            // Allow browsers that require a user gesture to start playback;
            // callers should trigger this from a click/tap handler.
            await audio.play();
        } else {
            // Same track: toggle play/pause
            if (audio.paused) {
                await audio.play();
            } else {
                audio.pause();
            }
        }
    } catch (e) {
        state.error = 'Autoplay blocked or playback failed';
        state.loading = false;
        state.isPlaying = false;
        // The user may need to click a play button again (user gesture)
    }
}

function pause() {
    ensureAudio();
    if (audio && !audio.paused) audio.pause();
}

function stop() {
    ensureAudio();
    if (!audio) return;
    audio.pause();
    audio.currentTime = 0;
    state.isPlaying = false;
}

function seek(toSeconds: number) {
    ensureAudio();
    if (!audio) return;
    audio.currentTime = Math.max(0, Math.min(toSeconds, state.duration || toSeconds));
}

function setVolume(v: number) {
    ensureAudio();
    const vol = Math.max(0, Math.min(v, 1));
    state.volume = vol;
    if (audio) audio.volume = vol;
}

function toggleMute() {
    ensureAudio();
    state.muted = !state.muted;
    if (audio) audio.muted = state.muted;
}

const progress = computed(() => {
    if (!state.duration) return 0;
    return state.currentTime / state.duration;
});

const progress_percent = computed(()=>(id:string|number|undefined) => {
    if (!state.duration) return 0;

    if (state.current?.id === id || id === undefined) {
        return (state.currentTime / state.duration) * 100;
    }

    return 0;
});

const progress_formatted = computed(()=>(id:string|number|undefined) => {
    if (state.current?.id === id || id === undefined) {
        const minutes = Math.floor(state.currentTime / 60);
        const seconds = Math.floor(state.currentTime % 60);
        return `${minutes}:${seconds.toString().padStart(2, '0')}`;
    }
    return '00:00';
});

const seek_click = (e: PointerEvent,id:string|number|undefined) => {

    if (state.current?.id === id) {
        const target = e.currentTarget as HTMLElement;
        const rect = target.getBoundingClientRect();
        const offsetX = e.clientX - rect.left;
        const percent = (offsetX / rect.width) * 100;
        const seconds = (percent / 100) * state.duration;
        seek(seconds);
    }
};



function useGlobalAudioPlayer() {
    ensureAudio();

    // Optional: clean up if the last consumer unmounts (player remains; no-op)
    onBeforeUnmount(() => {
        // Intentionally keep the singleton alive across pages.
    });

    return {
        state,
        progress,
        progress_percent,
        progress_formatted,
        play,
        pause,
        stop,
        seek,
        seek_click,
        setVolume,
        toggleMute,
    };
}

export { useGlobalAudioPlayer };
