# Vue + Quasar + Symfony + PostgreSQL (Docker)

Шаблон проекта:
- `frontend` - Quasar (Vue 3)
- `backend` - Symfony 6 (PHP-FPM + Nginx)
- `postgres` - PostgreSQL 15

## Основное

- Прокси в Quasar: все запросы на `/api/*` идут в Symfony через Nginx (`http://nginx:80`).
- Тестовый API-контроллер в Symfony:
  - `GET /api/ping`
- Тестовая страница во фронте (`IndexPage`), где есть кнопка проверки `Тест`

## Быстрый запуск

Из корня проекта:

```bash
docker compose up --build
```

Если ранее уже запускал контейнеры и менял версию Postgres, сначала очисти том БД:

```bash
docker compose down -v
```

Открыть:
- Frontend: <http://localhost:9000>
- Backend API: <http://localhost:8000/api/ping>

## Auth API (JWT + Refresh)

Логин:

```bash
curl 'http://localhost:8000/api/auth/login' \
  -H 'Content-Type: application/json' \
  -d '{"email":"admin","password":"password"}'
```

Ожидаемый ответ: JSON с полями `token` и `refresh_token`.

Обновление access токена:

```bash
curl 'http://localhost:8000/api/auth/refresh' \
  -H 'Content-Type: application/json' \
  -d '{"refresh_token":"<refresh_token>"}'
```

Проверка защищенного endpoint (пример):

```bash
curl 'http://localhost:8000/api/ping' \
  -H "Authorization: Bearer <token>"
```

## Проверка интеграции

1. Открой `http://localhost:9000`.
2. На главной странице нажми:
  - `Тест`(*Должен прийти JSON с `backend`*).

## Остановка

```bash
docker compose down
```

С удалением томов:

```bash
docker compose down -v
```