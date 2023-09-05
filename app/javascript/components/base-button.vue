<script setup lang="ts">
import { computed, useAttrs } from 'vue';

const props = withDefaults(
  defineProps<{
    variant?: string
  }>(),
  {
    variant: 'primary',
  },
);
const attrs = useAttrs();
const currentTag = computed(() => (attrs.href ? 'a' : 'button'));

const variants = {
  primary: 'bg-indigo-600 text-white hover:bg-indigo-700',
  secondary: 'border-indigo-300 bg-transparent text-indigo-600 hover:bg-indigo-50',
  danger: 'bg-rose-400 hover:bg-rose-500 text-white',
  success: 'bg-emerald-400 text-white hover:bg-emerald-500',
  disabled: 'bg-slate-400 text-white cursor-not-allowed',
};
</script>

<template>
  <component
    :is="currentTag"
    class="rounded px-3 py-2 text-sm font-semibold"
    :class="variants[props.variant as keyof typeof variants]"
  >
    <slot />
  </component>
</template>
