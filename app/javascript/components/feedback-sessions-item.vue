<script setup lang="ts">
import type { FeedbackSession } from 'api/feedback-sessions';
import tagClass from '../utils/tag-class';

interface Props {
  type: 'provider' | 'receiver';
  session: FeedbackSession,
}

const props = defineProps<Props>();
const sessionCommentsUrl = `/app/feedback_sessions/${props.session.id}/session_comments`;

</script>

<template>
  <div class="flex flex-row items-center gap-6 bg-white p-4 shadow">
    <img
      :src="require('images/icons/profile-picture.png')"
      class="h-6 w-6 rounded-full border border-indigo-400"
    >
    <span class="text-lg text-slate-800">
      {{ type === 'provider' ? props.session.receiver.name : props.session.provider.name }}
    </span>
    <span class="text-sm text-slate-500">{{ props.session.sessionDate }}</span>
    <div class="flex space-x-4">
      <span
        v-for="tag in session.tags"
        :key="tag.id"
        :class="tagClass(tag.name)"
      >
        {{ tag.name }}
      </span>
    </div>
    <a
      class="ml-auto flex h-6 w-6 items-center justify-center rounded-full bg-slate-100"
      :href="sessionCommentsUrl"
    >
      <inline-svg
        :src="require('images/icons/dots-vertical.svg')"
        class="h-4 w-4 fill-indigo-900"
      />
    </a>
  </div>
</template>
