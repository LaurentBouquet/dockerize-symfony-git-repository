FROM php:7.4.16-fpm-alpine
RUN apk --update --no-cache add git 
RUN docker-php-ext-install pdo pdo_mysql 
COPY --from=composer:1 /usr/bin/composer /usr/bin/composer1
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer2
WORKDIR /var/www
EXPOSE 9000

