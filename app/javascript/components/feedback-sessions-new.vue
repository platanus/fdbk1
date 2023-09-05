<script setup lang="ts">
import { ref } from 'vue';
import VueTagsInput from '@sipec/vue3-tags-input';
import { useMutation } from '@tanstack/vue-query';
import feedbackSessionsApi from 'api/feedback-sessions';
import type { User } from 'api/users';
import tagClass from '../utils/tag-class';
import capitalizeString from '../utils/capitalize-string';

interface VueTagsInputType {
  text: string;
  tiClasses: string[];
  classes?: string;
}
interface Props {
  users: User[],
}

const props = defineProps<Props>();

const currentTagNames = ref<VueTagsInputType[]>([]);
const newTagName = ref<string | undefined >(undefined);
const feedbackSessionDate = ref<string | undefined >(undefined);
const providerUserId = ref<number | undefined >(undefined);
const allUsers = ref(props.users);

function mutationFn() {
  if (
    providerUserId.value !== undefined &&
    feedbackSessionDate.value !== undefined &&
    currentTagNames.value.length > 0
  ) {
    return feedbackSessionsApi.create(providerUserId.value,
      feedbackSessionDate.value,
      currentTagNames.value.map(obj => obj.text),
    );
  }

  return Promise.reject();
}

const { mutate: createFeedbackSession } = useMutation({
  mutationFn,
  onSuccess: () => {
    window.location.href = '/';
  },
});

function handleTagsChanged(newTags: VueTagsInputType[]) {
  if (currentTagNames.value.length > newTags.length) {
    currentTagNames.value = newTags;
  } else {
    const newTag = newTags.pop();
    if (!newTag) return;
    newTag.text = capitalizeString(newTag.text);
    newTag.classes = tagClass(newTag.text);
    currentTagNames.value.push(newTag);
  }
}

</script>

<template>
  <div class="grid grid-cols-2 gap-5 rounded-lg bg-slate-100 p-4">
    <div class="col-span-2">
      <p class="text-slate-600">
        Se va a recibir feedback de
      </p>
      <base-select
        v-model="providerUserId"
        :options="allUsers"
      />
    </div>
    <div>
      <p class="text-slate-600">
        Fecha
      </p>
      <base-input
        v-model="feedbackSessionDate"
        class="mt-1"
        type="date"
      />
    </div>
    <div>
      <p class="text-slate-600">
        Tag
      </p>
      <vue-tags-input
        v-model="newTagName"
        placeholder="Agregar tag"
        :tags="currentTagNames"
        @tags-changed="handleTagsChanged"
      />
    </div>
    <base-button
      class="mr-auto h-9"
      @click="createFeedbackSession"
    >
      Guardar
    </base-button>
  </div>
</template>

<style lang="scss">

.vue-tags-input .ti-input {
  @apply rounded mt-1;
}

.vue-tags-input.ti-focus .ti-input {
  @apply border-2 border-indigo-600;
}

.ti-valid.ti-tag {
  @apply px-2 border border-solid font-semibold;
  border-radius: .25rem !important;
}

.ti-valid.yellow-tag.ti-tag {
  @apply bg-yellow-50 border-yellow-500 text-yellow-500;
}

.ti-valid.blue-tag.ti-tag {
  @apply bg-blue-50 border-blue-500 text-blue-500;
}

.ti-valid.red-tag.ti-tag {
  @apply bg-rose-50 border-rose-500 text-rose-500;
}

.ti-valid.purple-tag.ti-tag {
  @apply bg-violet-50 border-violet-500 text-violet-500;
}

.ti-valid.green-tag.ti-tag {
  @apply bg-emerald-50 border-emerald-500 text-emerald-500;
}

.ti-valid.orange-tag.ti-tag {
  @apply bg-orange-50 border-orange-500 text-orange-500;
}
</style>
