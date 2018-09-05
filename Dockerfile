# Base image
FROM php:7-fpm

# Apt get packages
RUN apt-get update
RUN apt-get install -y libicu-dev libpq-dev libpng-dev libtidy-dev

# Install PHP extensions
RUN docker-php-ext-install intl pgsql pdo_pgsql gd tidy

# Enable PHP extensions
RUN docker-php-ext-enable intl pgsql pdo_pgsql gd tidy

# Install Nginx
RUN apt-get install -y nginx

# Install Supervisor
RUN apt-get install -y supervisor

# Install debug utils
RUN apt-get install -y vim

# Copy config files
COPY ./docker/nginx/site.conf /etc/nginx/sites-available/default
COPY ./docker/php/timezone.ini /usr/local/etc/php/conf.d/timezone.ini
COPY ./docker/supervisor/supervisord.conf /etc/supervisor/conf.d/supervisord.conf 

# Copy application
COPY ./ /web/

# Change permissions of the application files
RUN chown www-data:www-data -Rf /web

# set entry point
ENTRYPOINT ["/usr/bin/supervisord"]

EXPOSE 80

# DONE!