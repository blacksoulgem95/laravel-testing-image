FROM jkaninda/laravel-php-fpm:8.4-alpine

ENV XDEBUG_MODE=coverage

RUN echo "🔧 Setting up Laravel test environment..." && \
    echo "📄 Copying .env.example to .env..." && \
    cp .env.example .env && \
    echo "🐘 PHP Version:" && \
    php --version && \
    echo "📦 Installing system dependencies..." && \
    apk add --no-cache --update linux-headers autoconf g++ make pcre-dev && \
    echo "🐛 Installing Xdebug..." && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    echo "📊 Setting Xdebug mode for coverage..." && \
    echo "🎼 Composer Version:" && \
    composer --version && \
    echo "📚 Installing Composer dependencies..." && \
    composer install --no-progress --prefer-dist --optimize-autoloader && \
    echo "🔑 Generating application key..." && \
    php artisan key:generate && \
    echo "🗄️  Creating SQLite database..." && \
    touch database/database.sqlite && \
    echo "✅ Setup completed successfully!"
