import { createGlobalState, useStorage } from '@vueuse/core';

export const useGlobalCart = createGlobalState(() => {
    const voices = useStorage('cart_voices', new Map<string, string>(), undefined, {
        serializer: {
            read: (v) => new Map(JSON.parse(v || '[]')),
            write: (v) => JSON.stringify(Array.from(v)),
        },
    });

    const order = useStorage(
        'cart_order',
        {
            description: '',
            title: '',
            script_text: '',
            deadline: '',
        },
        undefined,
        {
            serializer: {
                read: (v) => JSON.parse(v || '{}'),
                write: (v) => JSON.stringify(v),
            },
        },
    );

    function clearOrder() {
        order.value={
            description: '',
            title: '',
            script_text: '',
            deadline: '',
        }
        clearVoices();
    }

    function addVoice(voice: string) {
        if (!voices.value.has(voice)) {
            voices.value.set(voice, '');
        }
    }

    function removeVoice(voice: string) {
        if (voices.value.has(voice)) {
            voices.value.delete(voice);
        }
    }

    function addNote(voice: string, note: string) {
        if (voices.value.has(voice)) {
            voices.value.set(voice, note);
        }
    }

    function getNote(voice: string) {
        if (voices.value.has(voice)) {
            return voices.value.get(voice);
        }
        return '';
    }

    function existsInCard(voice: string) {
        return voices.value.has(voice);
    }

    function clearVoices() {
        voices.value.clear();
    }

    function asString() {
        return Array.from(voices.value.keys()).join(',');
    }

    return { voices, addVoice, addNote, existsInCard, clearVoices, asString, getNote, removeVoice, order, clearOrder };
});
