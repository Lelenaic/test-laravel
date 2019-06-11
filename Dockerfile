FROM chialab/php:7.1
WORKDIR /app
COPY . /app
EXPOSE 8000
RUN composer install --no-dev
RUN cp .env.example .env
RUN php artisan key:generate
RUN php artisan make:auth

CMD php artisan migrate --force ; php artisan serve --host=0.0.0.0
