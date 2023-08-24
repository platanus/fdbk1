<script setup lang="ts">
import BaseInput from './base-input.vue';
import BaseButton from './base-button.vue';
</script>

<template>
  <div class="grid grid-cols-2 gap-5 rounded-lg bg-slate-100 p-4">
    <div class="col-span-2">
      <p class="text-slate-600">
        Se va a recibir feedback de
      </p>
      <base-input
        class="mt-1"
      />
    </div>
    <div>
      <p class="text-slate-600">
        Fecha
      </p>
      <base-input
        class="mt-1"
        type="date"
      />
    </div>
    <div>
      <p class="text-slate-600">
        Tag
      </p>
      <base-input
        class="mt-1"
      />
    </div>
    <base-button class="mr-auto h-9">
      Guardar
    </base-button>
  </div>
</template>
