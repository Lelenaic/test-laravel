FROM chialab/php:7.1
WORKDIR /app
EXPOSE 8000
RUN (curl -O http://getcomposer.org/composer.phar \
; php composer.phar install --no-dev \
; cp .env.example .env \
; php artisan key:generate)

CMD php artisan serve
