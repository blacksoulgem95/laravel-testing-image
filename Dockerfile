FROM jkaninda/laravel-php-fpm:8.4-alpine

ENV XDEBUG_MODE=coverage

RUN echo "🔧 Setting up Laravel test environment..." && \
    echo "🐘 PHP Version:" && \
    php --version && \
    echo "📦 Installing system dependencies..." && \
    apk add --no-cache --update linux-headers autoconf g++ make pcre-dev nodejs npm && \
    echo "🐛 Installing Xdebug..." && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug && \
    echo "📊 Setting Xdebug mode for coverage..." && \
    echo "🎼 Composer Version:" && \
    composer --version && \
    echo "✅ Setup completed successfully!"
