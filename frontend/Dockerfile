FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache bash
# Используем npm версии рядом с окружением на хосте,
# чтобы меньше сюрпризов с resolve/pre-release зависимостями.
RUN npm install -g npm@10.8.2

EXPOSE 9000
