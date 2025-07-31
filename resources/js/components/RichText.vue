<script setup lang="ts">
import StarterKit from '@tiptap/starter-kit'
import { Content, useEditor } from '@tiptap/vue-3';
import { TiptapContent, TiptapProvider, TiptapStatusBar, TiptapToolbar } from '@/components/ui/tiptap';
import Link from '@tiptap/extension-link'

const field = defineModel<Content>();

const editor = useEditor({
    content: field.value,
    extensions: [
        StarterKit,
        // Add other extensions as needed
        Link.configure({
            openOnClick: false,
        }),
    ],
    onBlur() {
        field.value=editor.value?.getHTML();
    },
})
</script>

<template>
    <TiptapProvider :editor="editor">
        <TiptapToolbar />
        <TiptapContent />
        <TiptapStatusBar show-word-count />
    </TiptapProvider>
</template>
