FROM php:8.2-fpm-alpine

WORKDIR /var/www/html

RUN apk add --no-cache git unzip icu-dev postgresql-dev bash \
    && docker-php-ext-install pdo pdo_pgsql intl

COPY --from=composer:2 /usr/bin/composer /usr/local/bin/composer

EXPOSE 9000
