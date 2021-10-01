FROM php:7.4-fpm-buster
ADD ./php/www.conf /usr/local/etc/php/php.ini
RUN ln -sf /usr/share/zoneinfo/Asia/Manila /etc/localtime
RUN addgroup --gid 1000 magento && adduser --gid 1000 --shell /bin/bash magento
RUN mkdir -p /workspaces/magento
RUN chown magento:magento /workspaces/magento

RUN mkdir -p $HOME/.composer
ADD ./auth.json $HOME/.composer/auth.json

WORKDIR /workspaces/magento

RUN apt-get update && apt-get install -y vim-nox lsb-release apt-transport-https ca-certificates apt-utils wget curl gnupg libxml2-dev git  libonig5 libonig-dev libcurl4 libcurl4-openssl-dev libxml2-dev libgd3 libgd-dev libpng16-16 libpng-dev libjpeg62-turbo libjpeg62-turbo-dev libfreetype6 libfreetype6-dev libmcrypt4 libmcrypt-dev zip unzip

RUN docker-php-ext-install mysqli pdo pdo_mysql soap gd iconv curl xml intl bcmath mbstring sockets
RUN docker-php-ext-enable mysqli pdo pdo_mysql soap gd iconv curl xml intl bcmath mbstring sockets

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini
RUN docker-php-ext-enable xdebug

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
