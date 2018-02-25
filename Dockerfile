FROM php
WORKDIR /app
EXPOSE 8000
RUN wget http://getcomposer.org/composer.phar \
; php composer.phar install --no-dev \
; cp .env.example .env \
; php artisan key:generate

CMD php artisan serve
