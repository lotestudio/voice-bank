<template>
    <div
        class="star-rating"
        role="radiogroup"
        :aria-label="label"
        @mouseleave="onMouseLeave"
    >
        <button
            v-for="n in max"
            :key="n"
            class="star"
            :class="{ filled: (hover || value) >= n }"
            role="radio"
            :aria-checked="value === n"
            :tabindex="n === 1 ? 0 : -1"
            @click="select(n)"
            @keydown.space.prevent="select(n)"
            @keydown.enter.prevent="select(n)"
            @mousemove="onMouse(n)"
            :title="n + ' / ' + max"
        >
            <span class="visually-hidden">{{ n }} of {{ max }}</span>
            ★
        </button>
    </div>
</template>

<script setup>
import { ref, watch, toRefs } from 'vue';

const props = defineProps({
    modelValue: { type: Number, default: 0 }, // v-model
    max: { type: Number, default: 5 },
    label: { type: String, default: 'Rating' },
    readonly: { type: Boolean, default: false },
});

const emit = defineEmits(['update:modelValue', 'change']);

const { modelValue, max, readonly } = toRefs(props);

const value = ref(modelValue.value);
const hover = ref(0);

watch(modelValue, (v) => (value.value = v));

function select(n) {
    if (readonly.value) return;
    value.value = n;
    emit('update:modelValue', n);
    emit('change', n);
}

function onMouse(n) {
    if (readonly.value) return;
    hover.value = n;
}

function onMouseLeave() {
    hover.value = 0;
}
</script>

<style scoped>
.star-rating {
    display: inline-flex;
    gap: 0.25rem;
}
.star {
    background: transparent;
    border: none;
    font-size: 1.8rem;
    cursor: pointer;
    line-height: 1;
    padding: 0.1rem;
    transition: transform .08s;
}
.star:focus { transform: scale(1.1); }
.star.filled { color: var(--color-gold-300); text-shadow: 0 1px 0 rgba(0,0,0,.2); }
.star:not(.filled) { color: var(--muted); }
.visually-hidden { position: absolute; left: -9999px; }
</style>
