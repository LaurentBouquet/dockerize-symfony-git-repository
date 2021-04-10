#!/bin/sh

git clone $GIT_REPO_URL symfony

cd symfony 

git checkout $GIT_REPO_BRANCH

$COMPOSER_VERSION install 

php bin/console doctrine:migrations:migrate -n 

php bin/console doctrine:fixtures:load -n 

php-fpm

