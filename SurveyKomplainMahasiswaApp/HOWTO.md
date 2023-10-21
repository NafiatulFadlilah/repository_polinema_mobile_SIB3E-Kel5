# Panduan instalasi aplikasi

## Software yang Dibutuhkan
- XAMPP
- Composer
- Node JS
- Visual Studio Code
- Android Studio
- Laravel
- Flutter

## Langkah-langkah persiapan laravel
1. Pastikan software-software yang dibutuhkan telah terinstall.
2. Buat database baru dengan nama "**laravel_backend_survey_api**" menggunakan XAMPP dan phpMyAdmin.
3. Masuk ke terminal repository ini dan pindah ke path laravel menggunakan perintah:
    ```bash
    cd .\SurveyKomplainMahasiswaApp\laravel-backend_survey-api\
    ```
4. Jalankan migrasi proyek laravel menggunakan perintah: 
    ```bash
    php artisan migrate
    ```
5. Isi database menggunakan perintah:
    ```bash
    php artisan db:seed --class=StudentComplaintSurveySeeder
    ```
6. Jalankan aplikasi laravel menggunakan perintah:
    ```bash
    php artisan serve
    ```