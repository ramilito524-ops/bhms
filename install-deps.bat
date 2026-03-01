@echo off
REM Install Laravel dependencies when Composer is not in PATH
REM Requires: PHP in PATH (e.g. from XAMPP, Laragon, or php.net)

cd /d "%~dp0"

if not exist "composer.phar" (
    echo Downloading Composer...
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php composer-setup.php
    del composer-setup.php 2>nul
)

echo Running composer install...
php composer.phar install

echo.
echo Done. If you see no errors, run: php artisan key:generate
echo Then copy .env.example to .env and set your DB credentials.
echo Then: php artisan migrate
echo       php artisan db:seed
pause
