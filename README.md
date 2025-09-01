# Laravel Testing Docker Image

This repository, maintained by Sofia Vicedomini, provides a lightweight Docker image for running unit and mutation tests for Laravel applications. It is built on top of the `jkaninda/laravel-php-fpm:8.4-alpine` image and includes Xdebug for code coverage.

## Features
- PHP 8.4 with Laravel support
- Xdebug enabled for code coverage
- Lightweight Alpine Linux base image
- Copies `.env.example` to `.env` for environment setup

## Prerequisites
- Docker installed on your system
- A Laravel project with a `.env.example` file
- Composer dependencies already installed in your project
- PHPUnit and/or mutation testing tools (e.g., Infection) configured in your Laravel project
- A database (e.g., SQLite) set up for testing, if required

## Usage
1. Clone this repository:
   ```bash
   git clone https://github.com/blacksoulgem95/laravel-testing-image.git
   cd laravel-testing-image
   ```

2. Place your Laravel project files in the same directory as the `Dockerfile` or mount your project as a volume when running the container.

3. Build the Docker image:
   ```bash
   docker build -t laravel-test .
   ```

4. Run the container to execute tests:
   ```bash
   docker run --rm -v $(pwd):/var/www/html laravel-test sh -c "vendor/bin/phpunit --coverage-clover clover.xml"
   ```

   For mutation testing with Infection (if installed):
   ```bash
   docker run --rm -v $(pwd):/var/www/html laravel-test sh -c "vendor/bin/phpunit --coverage-clover clover.xml && vendor/bin/infection --coverage=clover.xml"
   ```

## Dockerfile Overview
The `Dockerfile` performs the following steps:
- Uses `jkaninda/laravel-php-fpm:8.4-alpine` as the base image
- Sets `XDEBUG_MODE=coverage` for code coverage
- Copies `.env.example` to `.env`
- Installs system dependencies (e.g., `linux-headers`, `autoconf`, `g++`, `make`, `pcre-dev`)
- Installs and enables Xdebug for code coverage

**Note**: This image assumes that Composer dependencies are already installed in your project and that any database setup (e.g., SQLite) is handled separately.

## Testing
- **Unit Tests**: Ensure your Laravel project includes PHPUnit tests. Run them using:
  ```bash
  docker run --rm -v $(pwd):/var/www/html laravel-test vendor/bin/phpunit
  ```
- **Mutation Testing**: If using Infection, run:
  ```bash
  docker run --rm -v $(pwd):/var/www/html laravel-test vendor/bin/infection
  ```

## License
This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

Copyright (c) 2025 Sofia Vicedomini

## Contributing
Contributions are welcome! Please open an issue or submit a pull request on the [GitHub repository](https://github.com/blacksoulgem95/laravel-testing-image) for any improvements or bug fixes.

## Contact
For questions or feedback, feel free to open an issue on the [GitHub repository](https://github.com/blacksoulgem95/laravel-testing-image).
