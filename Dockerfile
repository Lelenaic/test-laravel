FROM chialab/php:7.1
WORKDIR /app
ADD . /app
EXPOSE 8000
RUN composer.phar install --no-dev
RUN cp .env.example .env
RUN php artisan key:generate

CMD php artisan serve --host=0.0.0.0
