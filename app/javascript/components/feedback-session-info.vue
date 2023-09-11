<script setup lang="ts">
import type { FeedbackSession } from 'api/feedback-sessions';

interface Props {
  session: FeedbackSession,
}

const props = defineProps<Props>();
</script>

<template>
  <div class="flex w-80 flex-col items-start gap-2 rounded bg-blue-50 py-3 px-2 md:w-auto md:max-w-lg md:flex-row md:items-start md:justify-between md:rounded-lg md:p-2">
    <div class="flex items-start gap-2 md:flex-col">
      <span class="font-base text-sm font-normal text-slate-500">Realizada por:</span>
      <div class="flex items-center gap-2">
        <img
          class="h-5 w-5 rounded-full border-2 border-solid border-indigo-400 md:h-6 md:w-6"
          :src="require('images/icons/profile-picture.png')"
        >
        <span class="font-base text-base font-normal not-italic text-slate-700">{{ props.session.provider.name }}</span>
      </div>
    </div>
    <div class="flex items-center justify-center gap-2 md:flex-col md:items-start">
      <span class="font-base text-sm font-normal text-slate-500">Fecha:</span>
      <div class="flex items-center justify-center gap-1">
        <span class="w-20 font-base text-base font-normal not-italic  text-slate-700">{{ props.session.sessionDate }}</span>
        <inline-svg
          :src="require('images/icons/pen-icon.svg')"
          class="h-4 w-4 shrink-0"
        />
      </div>
    </div>
  </div>
</template>
