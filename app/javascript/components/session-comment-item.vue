<script setup lang="ts">
import type { SessionComment } from 'api/session-comments';

interface Props {
  comment: SessionComment
}

const props = defineProps<Props>();

</script>
<template>
  <div class="w-80 gap-3 rounded-md border-2 border-solid border-gray-200 bg-white p-3 shadow md:w-full md:max-w-3xl md:rounded-lg ">
    <p class="font-base text-sm font-normal text-gray-700">
      {{ props.comment.body }}
    </p>
  </div>
</template>
