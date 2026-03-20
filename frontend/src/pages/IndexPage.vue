<template>
  <q-page class="q-pa-lg">
    <div class="column q-gutter-md">
      <div class="text-h5">Тест интеграции Frontend / Backend</div>
      <div class="text-body1">
        Кнопки ниже проверяют: запросы с фронта на Symfony API.
      </div>

      <div class="row q-gutter-sm">
        <q-btn color="primary" label="Тест" @click="checkBackend" />
      </div>

      <q-card flat bordered>
        <q-card-section>
          <div class="text-subtitle1">Ответ / ошибка</div>
          <pre class="response-box">{{ responseText }}</pre>
        </q-card-section>
      </q-card>
    </div>
  </q-page>
</template>

<script setup>
import { ref } from 'vue'
import { api } from 'src/boot/axios'

const responseText = ref('Нажми кнопку для проверки связки.')

const print = (payload) => {
  responseText.value = JSON.stringify(payload, null, 2)
}

const formatError = (error) => ({
  message: error?.message ?? 'Unknown error',
  status: error?.response?.status ?? null,
  data: error?.response?.data ?? null,
})

const checkBackend = async () => {
  try {
    const { data } = await api.get('/ping')
    print(data)
  } catch (error) {
    print(formatError(error))
  }
}
</script>

<style scoped>
.response-box {
  margin: 0;
  white-space: pre-wrap;
  word-break: break-word;
}
</style>
