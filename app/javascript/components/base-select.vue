<script setup lang="ts">

const props = defineProps<{
  modelValue?: string | number;
  options?: { id: number; name: string }[]
}>();

const emit = defineEmits<{
  (event: 'update:modelValue', value: string): void;
}>();

</script>

<template>
  <select
    :v-model="props.modelValue"
    class="w-full rounded border-slate-200 bg-white focus:ring-indigo-600"
    @change="emit('update:modelValue', ($event.target as HTMLInputElement).value)"
  >
    <option value="">
      Selecciona una opción
    </option>
    <option
      v-for="option in props.options"
      :key="option.id"
      :value="option.id"
    >
      {{ option.name }}
    </option>
  </select>
</template>
