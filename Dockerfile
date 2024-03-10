# Use Alpine Linux as base image
FROM php:8.2-fpm-alpine

# Install Node.js and npm
RUN apk add --no-cache nodejs npm

# Set working directory
WORKDIR /var/www

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Copy composer.lock and composer.json
COPY base/composer.lock base/composer.json ./

# Install Composer dependencies
# RUN blog/composer install --no-dev --optimize-autoloader

# Install dependencies
RUN apk update && apk add --no-cache \
    build-base \
    libpng-dev \
    libjpeg-turbo-dev \
    freetype-dev \
    libzip-dev \
    oniguruma-dev \
    jpegoptim optipng pngquant gifsicle \
    vim \
    unzip \
    git \
    curl \
    libzip \
    libgd \
    freetype \
    libjpeg-turbo \
    libpng

# Clear cache
RUN rm -rf /var/cache/apk/*

# Install PHP extensions
RUN docker-php-ext-install bcmath pdo_mysql mbstring zip exif pcntl gd

# Add user for Laravel application
RUN addgroup -g 1000 www && adduser -u 1000 -D -G www www

# Copy existing application directory contents
COPY base ./

# Change ownership of the storage directory to the web server user
RUN chown -R www-data:www-data /var/www
# RUN chown -R www-data:www-data /var/www/storage

# Ensure the storage/logs directory is writable
RUN chmod -R 775 /var/www/storage/logs
# RUN chmod -R 775 /var/www

# Change permissions
RUN chown -R www-data:www-data storage bootstrap/cache

# Change logs permissions
# RUN chown -R www-data:www-data storage logs/cache

# Change current user to www
USER www

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
