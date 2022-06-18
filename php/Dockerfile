FROM php:7.4-fpm
 
ARG APP_ENV

COPY ./php/init.sh /tmp
RUN chmod +x /tmp/init.sh
RUN /tmp/init.sh

COPY ./php/install.sh /tmp
RUN chmod +x /tmp/install.sh
RUN /tmp/install.sh
 
COPY ./php/www.conf /usr/local/etc/php-fpm.d/www.conf.default
COPY ./php/php.ini /usr/local/etc/php/conf.d
 
ENV LANG en_GB.UTF-8
ENV LANGUAGE en_GB:en
ENV LC_ALL en_GB.UTF-8
 
RUN apt-get autoremove --purge \
 && apt-get -y clean \
 && rm -rf /var/lib/apt/lists/*

# symfony cli
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony

# yarn rights access
RUN curl --silent --show-error https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && mkdir /var/www/.composer \
    && chown www-data:www-data /var/www/.composer \
    && mkdir /var/www/.symfony \
    && mkdir /var/www/.cache \
    && chmod -R 777 /var/www/.symfony \
    && chmod -R 777 /var/www/.cache \
    && chmod -R 777 /var/www/.composer \
    && chown www-data:www-data /var/www/.symfony \
    && chown www-data:www-data /var/www/.cache

RUN usermod -u 1000 www-data

USER 1000

WORKDIR /var/www/symfony

CMD ["php-fpm"]