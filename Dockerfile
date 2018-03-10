FROM chialab/php:7.1
WORKDIR /app
COPY . /app
ARG MARIADB_ROOT_PASSWORD
EXPOSE 8000
RUN apt update && apt install -yqq mysql-client
RUN echo "create database if not exists laravel;" | mysql -hmariadb -uroot -p$MARIADB_ROOT_PASSWORD
RUN composer install --no-dev
RUN cp .env.example .env
RUN php artisan key:generate
RUN php artisan make:auth
RUN php artisan migrate

CMD php artisan serve --host=0.0.0.0
