#!/usr/bin/env bash
# Install Laravel dependencies when Composer is not in PATH
# Requires: PHP in PATH

set -e
cd "$(dirname "$0")"

if [ ! -f composer.phar ]; then
  echo "Downloading Composer..."
  php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
  php composer-setup.php
  rm -f composer-setup.php
fi

echo "Running composer install..."
php composer.phar install

echo ""
echo "Done. Next steps:"
echo "  1. cp .env.example .env   (or copy on Windows)"
echo "  2. php artisan key:generate"
echo "  3. Set DB_DATABASE, DB_USERNAME, DB_PASSWORD in .env"
echo "  4. php artisan migrate"
echo "  5. php artisan db:seed"
echo "  6. php artisan serve"
