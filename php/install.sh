#!/bin/bash
 
printf "\n\033[0;44mInstalling system packages for the \"${APP_ENV}\" environment\033[0m\n"
 
apt-get update
apt-get install -y --no-install-recommends zip unzip nano tree locales zlib1g-dev libicu-dev g++
 
sed -i 's/# en_GB.UTF-8 UTF-8/en_GB.UTF-8 UTF-8/g' /etc/locale.gen
ln -s /etc/locale.alias /usr/share/locale/locale.alias
locale-gen en_GB.UTF-8
 
ln -snf /usr/share/zoneinfo/Europe/London /etc/localtime
echo Europe/London > /etc/timezone
 
#curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
 
docker-php-ext-install opcache pdo_mysql intl
docker-php-ext-enable opcache
docker-php-ext-configure intl
docker-php-ext-enable intl
 
if [ "${APP_ENV}" == "dev" ] || [ "${APP_ENV}" == "test" ]
then
    pecl install xdebug
    docker-php-ext-enable xdebug
fi