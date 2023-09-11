<script setup lang="ts">
import type { SessionComment } from 'api/session-comments';
import type { FeedbackSession } from 'api/feedback-sessions';
import { reactive } from 'vue';

interface Props {
  session: FeedbackSession
  loading: boolean
}

const props = defineProps<Props>();

const form: Omit<SessionComment, 'id'> = reactive({
  body: '',
  feedbackSessionId: props.session.id,
});

const emit = defineEmits<{
  (event: 'submit', comment: Omit<SessionComment, 'id'>): void;
}>();

</script>
<template>
  <form
    class="flex w-80 flex-col items-start gap-5 rounded-md bg-blue-100 p-4 md:w-auto md:max-w-3xl md:rounded-lg"
    @submit.prevent="emit('submit', form)"
  >
    <div class="flex h-32 flex-col items-start gap-1 self-stretch">
      <p class="font-base text-base font-normal not-italic">
        Comentario
      </p>
      <textarea
        v-model="form.body"
        class="h-full w-full gap-2 rounded-md border-2 border-solid border-blue-200 bg-white py-2 px-4 md:grow md:gap-3"
      />
    </div>

    <base-button
      :disabled="loading"
      class="flex items-center justify-center gap-2 rounded bg-indigo-500 p-2"
    >
      <inline-svg
        :src="require('images/icons/commment-icong.svg')"
        class="h-4 w-4 shrink-0"
      />
      <p class="text-center font-base text-base font-semibold text-white">
        Añadir comentario
      </p>
    </base-button>
  </form>
</template>
