FROM chialab/php:7.1
WORKDIR /app
VOLUME /app
EXPOSE 8000
RUN pwd && curl -O http://getcomposer.org/composer.phar
RUN php composer.phar install --no-dev
RUN cp .env.example .env
RUN php artisan key:generate

CMD php artisan serve
