<script setup lang="ts">
interface Props {
  linkTo?: string,
}

withDefaults(defineProps<Props>(), {
  linkTo: '/',
});

</script>

<template>
  <a
    class="flex h-8 w-14 items-center justify-center rounded-full bg-slate-100 hover:bg-slate-200"
    :href="linkTo"
  >
    <inline-svg
      :src="require('images/icons/arrow-back.svg')"
      class="h-4 fill-slate-500"
    />
  </a>
</template>
