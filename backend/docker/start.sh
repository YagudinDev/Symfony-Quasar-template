#!/usr/bin/env sh
set -eu

cd /var/www/html
composer install --no-interaction

# Symfony writes cache/logs as www-data inside php-fpm.
mkdir -p var/cache var/log
chown -R www-data:www-data var
chmod -R ug+rwX var

php-fpm -F
