# Base image
FROM php:7-fpm

# Apt get packages
RUN apt-get update
RUN apt-get install -y libicu-dev libpq-dev libpng-dev libtidy-dev

# Install PHP extensions
RUN docker-php-ext-install intl pgsql pdo_pgsql gd tidy

# Enable PHP extensions
RUN docker-php-ext-enable intl pgsql pdo_pgsql gd tidy

# DONE!