FROM chialab/php:7.1
WORKDIR /app
COPY . /app
ARG MARIADB_ROOT_PASSWORD
ARG MARIADB_HOSTNAME
EXPOSE 8000
RUN composer install --no-dev
RUN cp .env.example .env
RUN php artisan key:generate
RUN php artisan make:auth
RUN php artisan migrate

CMD php artisan serve --host=0.0.0.0
