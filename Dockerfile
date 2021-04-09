FROM php:7.4-fpm-alpine
RUN apk --update --no-cache add git 
RUN docker-php-ext-install pdo pdo_mysql
COPY --from=composer /usr/bin/composer /usr/bin/composer
WORKDIR /var
# if DEV
CMD git clone https://github.com/LaurentBouquet/joliquiz.git ; mv joliquiz www ; cd www ; git checkout develop-mysql ; composer install ; bin/console doctrine:migrations:migrate -n ;  bin/console doctrine:fixtures:load -n ; php-fpm
# if PROD (cf doc Symfony)
# TODO
EXPOSE 9000

