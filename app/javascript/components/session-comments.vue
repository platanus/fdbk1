<script setup lang="ts">
import type { FeedbackSession } from 'api/feedback-sessions';
import type { SessionComment } from 'api/session-comments';
import FeedbackSessionInfo from './feedback-session-info.vue';
import SessionCommentItem from './session-comment-item.vue';
import BackButton from './back-button.vue';

interface Props {
  feedbackSession: FeedbackSession,
  sessionComments: SessionComment[]
}

const props = defineProps<Props>();

const newCommentUrl = `/app/feedback_sessions/${props.feedbackSession.id}/session_comments/new`;

</script>

<template>
  <back-button />
  <div class="flex flex-col justify-center ">
    <template v-if="props.feedbackSession">
      <div class="inline-flex flex-col items-start gap-4 md:gap-7">
        <base-title class="font-base text-2xl font-normal text-gray-700 md:text-3xl">
          Sesión de feedback #{{ props.feedbackSession.id }}
        </base-title>
        <feedback-session-info :session="props.feedbackSession" />
      </div>
      <div class="flex w-80 flex-col items-start gap-2 md:inline-flex md:w-auto md:max-w-3xl">
        <div class="w-full items-center justify-between md:flex  md:max-w-3xl">
          <p class="m-2 font-base text-xl font-normal text-gray-500">
            Comentarios
          </p>
          <base-button
            class="flex w-full items-center justify-center gap-2 rounded bg-indigo-500 p-2 md:w-auto"
            :href="newCommentUrl"
          >
            <inline-svg
              :src="require('images/icons/commment-icong.svg')"
              class="h-4 w-4 shrink-0"
            />
            <p class=" text-center font-base text-sm font-semibold text-white">
              Añadir comentario
            </p>
          </base-button>
        </div>
        <session-comment-item
          v-for="comment in props.sessionComments"
          :key="comment.id"
          :comment="comment"
        />
      </div>
    </template>
  </div>
</template>
