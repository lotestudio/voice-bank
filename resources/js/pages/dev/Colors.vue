<script setup lang="ts">
import { onMounted, ref, computed } from 'vue';

type ColorVar = {
  name: string;
  value: string;
};

const loading = ref<boolean>(true);
const search = ref<string>('');
const colors = ref<ColorVar[]>([]);

function collectColorVariables(): ColorVar[] {
  const map = new Map<string, string>();
  //common semantic variables exposed in app.css
  const docStyle = getComputedStyle(document.documentElement);
  const fallbackCandidates = [
    '--color-background',
    '--color-foreground',
    '--color-card',
    '--color-card-foreground',
    '--color-popover',
    '--color-popover-foreground',
    '--color-primary',
    '--color-primary-foreground',
    '--color-secondary',
    '--color-secondary-foreground',
    '--color-muted',
    '--color-muted-foreground',
    '--color-accent',
    '--color-accent-foreground',
    '--color-destructive',
    '--color-destructive-foreground',
    '--color-border',
    '--color-input',
    '--color-ring',
    '--color-chart-1',
    '--color-chart-2',
    '--color-chart-3',
    '--color-chart-4',
    '--color-chart-5',
    '--color-sidebar',
    '--color-sidebar-foreground',
    '--color-sidebar-primary',
    '--color-sidebar-primary-foreground',
    '--color-sidebar-accent',
    '--color-sidebar-accent-foreground',
    '--color-sidebar-border',
    '--color-sidebar-ring',
    '--color-gold-50',
    '--color-gold-100',
    '--color-gold-200',
    '--color-gold-300',
    '--color-gold-400',
    '--color-gold-500',
    '--color-gold-600',
    '--color-gold-700',
    '--color-gold-800',
    '--color-gold-900',
    '--color-gold-950',
  ];
  for (const name of fallbackCandidates) {
    if (!map.has(name)) {
      const val = docStyle.getPropertyValue(name).trim();
      if (val) {
        map.set(name, val);
      }
    }
  }

  // Convert to array and sort nicely:
  const entries = Array.from(map.entries()).map(([name, value]) => ({ name, value }));
  entries.sort((a, b) => a.name.localeCompare(b.name));
  return entries;
}

onMounted(() => {
  colors.value = collectColorVariables();
  loading.value = false;
});

const filtered = computed(() => {
  const q = search.value.trim().toLowerCase();
  if (!q) {
    return colors.value;
  }
  return colors.value.filter((c) => c.name.toLowerCase().includes(q));
});

function copyToClipboard(text: string): void {
  navigator.clipboard?.writeText(text).catch(() => {
    // no-op
  });
}
</script>

<template>
  <section class="my-8">
    <header class="mb-6 flex flex-col gap-3 sm:flex-row sm:items-center sm:justify-between">
      <div>
        <h2 class="font-bold text-2xl tracking-tight">Design Tokens: Colors</h2>
        <p class="text-muted-foreground text-sm">Automatically read from CSS variables that start with <code>--color-*</code>.</p>
      </div>
      <div class="flex items-center gap-3">
        <input
          v-model="search"
          type="search"
          placeholder="Filter colors (e.g. primary, gold)"
          class="h-10 w-72 rounded-md border border-border bg-background px-3 text-sm outline-none ring-ring/0 focus:ring-2"
        />
      </div>
    </header>

    <div v-if="loading" class="grid grid-cols-[repeat(auto-fit,minmax(220px,1fr))] gap-4">
      <div v-for="i in 8" :key="i" class="animate-pulse rounded-lg border border-border p-4">
        <div class="h-24 w-full rounded-md bg-muted mb-3"></div>
        <div class="h-4 w-2/3 rounded bg-muted"></div>
      </div>
    </div>

    <div v-else>
      <div v-if="filtered.length === 0" class="text-muted-foreground text-sm">No colors found. Try a different search.</div>

      <div v-else class="grid grid-cols-[repeat(auto-fit,minmax(240px,1fr))] gap-4">
        <article
          v-for="color in filtered"
          :key="color.name"
          class="group relative overflow-hidden rounded-xl border border-border bg-card shadow-sm"
        >
          <div class="flex items-center gap-4 p-4">
            <div class="h-16 w-16 shrink-0 rounded-md border border-border" :style="{ background: `var(${color.name})` }"></div>
            <div class="min-w-0">
              <div class="font-medium text-sm">{{ color.name.replace(/^--/, '') }}</div>
              <div class="text-muted-foreground truncate text-xs">{{ color.value }}</div>
            </div>
          </div>
          <footer class="border-t border-border bg-muted/20 p-3 text-right flex justify-between items-center">
            <button
              type="button"
              class="inline-flex items-center gap-2 rounded-md bg-background px-3 py-1.5 text-xs font-medium ring-1 ring-inset ring-border hover:bg-muted"
              @click="copyToClipboard(color.name)"
              title="Copy CSS variable name"
            >
              <span class="i-copy text-sm"></span>
              Copy var name
            </button>
            <button
              type="button"
              class="ml-2 inline-flex items-center gap-2 rounded-md bg-background px-3 py-1.5 text-xs font-medium ring-1 ring-inset ring-border hover:bg-muted"
              @click="copyToClipboard(`var(${color.name})`)"
              title="Copy CSS var() reference"
            >
              <span class="i-document text-sm"></span>
              Copy var()
            </button>
          </footer>
        </article>
      </div>
    </div>
  </section>

</template>

<style scoped>
code {
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, "Liberation Mono", "Courier New", monospace;
}
</style>
