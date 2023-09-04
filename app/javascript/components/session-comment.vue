<script setup lang="ts">
import { ref } from 'vue';
import type { FeedbackSession } from 'api/feedback-sessions';
import sessionComments, { type SessionComment } from 'api/session-comments';
import FeedbackSessionInfo from './feedback-session-info.vue';
import SessionCommentForm from './session-comment-form.vue';

interface Props {
  initialSession: FeedbackSession,
}

const props = defineProps<Props>();

const formError = ref('');
const loading = ref(false);
const session = ref(props.initialSession);

async function submitForm(comment: Omit<SessionComment, 'id'>) {
  try {
    formError.value = '';
    loading.value = true;
    await sessionComments.create(comment.body, comment.feedbackSessionId);
    window.location.href = `/app/feedback_sessions/${comment.feedbackSessionId}/session_comments/`;
  } catch (error) {
    formError.value = 'Error al generar el comentario.';
  } finally {
    loading.value = false;
  }
}

</script>

<template>
  <div class="flex flex-col justify-center ">
    <template v-if="session">
      <div class="inline-flex flex-col items-start gap-4 md:gap-7">
        <base-title class="font-base text-2xl font-normal text-gray-700 md:text-3xl">
          Sesión de feedback #{{ session.id }}
        </base-title>
        <feedback-session-info
          :session="session"
        />
      </div>
      <p class="m-2 font-base text-xl font-normal text-gray-700">
        Crear comentario
      </p>
      <session-comment-form
        :session="session"
        :loading="loading"
        @submit="submitForm"
      />
      <p
        v-if="formError"
        class="mt-4 text-center text-red-500"
      >
        {{ formError }}
      </p>
    </template>
  </div>
</template>
