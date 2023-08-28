# PHPのインストール
FROM php:8.2.7-fpm

# Composerのインストール
RUN curl -sS https://getcomposer.org/installer  \
    | php -- --install-dir=/usr/local/bin --filename=composer --version=2.5.8

# PHP拡張機能とxdebugのインストール
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    unzip \
    git \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd pdo pdo_mysql \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug

# php.iniのコピー
# COPY ./php.ini /usr/local/etc/php/conf.d/custom.ini
COPY ./php.ini /usr/local/etc/php/php.ini

# Laravelのインストール
ENV COMPOSER_ALLOW_SUPERUSER=1
RUN composer global require laravel/installer

# パスの設定
ENV PATH $PATH:/root/.composer/vendor/bin

# ディレクトリ指定
WORKDIR /var/www/laravel-app
