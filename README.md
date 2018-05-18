# How to install this project 

## For windows and Mac 

1) Download Repo, zip or clone
2) Put that folder in xampp/htdocs for Windows. Or Mamp folder if use Mac
3) Open Folder Options, enable view hidden files, (step 4, needed this)
4) Run xampp, use 'apache' and 'mysql'. Or Mamp, if use Mac
5) Go to ‘localhost/phpmyadmin’ create database named ‘leave_request’ and another as ‘homestead’ (use MySQL)
	Set user as ‘root’
	Set password as ‘root’
	Make sure your port is ‘3306’ with default ‘localhost’ IP address
6) import the ‘leave_request.sql’ file, located at the project folder itself, then click ‘Go’
7) Run command line then ‘cd’ to active the path of that project folder
8) Run command ‘cp .env.example .env’ to set environment .env file
9) run ‘composer require laravel/passport’
10) run 'composer install'
11) run 'npm install' (then 'npm run production' if you want to commit any Updates from the Vue components)
12) generate security key, run 'php artisan key:generate'
13) visit 'localhost/<folder project name>/public'

How to install passport

1) install passport by
```sh
composer require laravel/passport
```

2) make migration with database
```sh
php artisan migrate
```

3) run this command to create encryption keys.
```sh
php artisan passport:install
```
