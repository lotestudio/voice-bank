<template>
  <div class="absolute inset-0">
    <RippleCircle
      v-for="index in numberOfCircles"
      :key="index"
      :opacity="baseCircleOpacity - index * circleOpacityDowngradeRatio"
      :size="baseCircleSize + index * spaceBetweenCircle"
      :animation-delay="index * waveSpeed"
      :border-style="'solid'"
      :class="circleClass"
    />
  </div>
</template>

<script setup lang="ts">
import RippleCircle from '@/components/ui/ripple/RippleCircle.vue';

interface Props {
  baseCircleSize?: number;
  baseCircleOpacity?: number;
  spaceBetweenCircle?: number;
  circleOpacityDowngradeRatio?: number;
  circleClass?: string;
  waveSpeed?: number;
  numberOfCircles?: number;
}

withDefaults(defineProps<Props>(), {
  baseCircleSize: 210,
  baseCircleOpacity: 0.5,
  circleOpacityDowngradeRatio: 0.03,
  waveSpeed: 180,
  spaceBetweenCircle: 70,
  numberOfCircles: 70,
});
</script>
