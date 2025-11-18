// resources/js/composables/useAuth.ts
import { computed } from 'vue';
import { usePage } from '@inertiajs/vue3';

export function useAuth() {
    const page = usePage();
    const user = computed(() => page.props.auth?.user ?? null);
    const role = computed(() => user.value?.role ?? null);
    const isArtist = computed(() => role.value === 'artist');
    const isClient = computed(() => role.value === 'client');

    return {
        user,
        role,
        isArtist,
        isClient,
    };
}
