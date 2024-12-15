<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://i.ibb.co/BwfCpGS/Screenshot-2024-12-15-180538.png" alt="Screenshot-2024-12-15-180538" width="400" alt="Laravel Logo"></a></p>




# Running a Cloned Enrollment System focused on scheduling system project

E Follow ni nga mga steps para ma pa run ninyo ang ang project after ninyo ma download

---

## Prerequisites

Ensure you have the following installed on your system:
- **PHP (>= 8.2)**
- **Composer** (Dependency Manager for PHP)
- **XAMPP WITH MSQL** or another supported database

---

## Step 1: Create new .env file, and configure DATABASE

1. Open the the project using VScode
2. Create new .env file inside project
3. Look for the .env.example and copy the contents to the newly created .env file
4. Replace the current configuration of the database inside the .env  with these one:
    ```bash
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=amora-enrollment-system
    DB_USERNAME=root
    DB_PASSWORD=
     ```


## Step 2: Download my sql file, para dinamo mag pa run sa script og naa nay graph

1.Download this mysql file, link:
  ```bash
   https://www.mediafire.com/file/du62pckxf7qtzbo/amora-enrollment-system.sql/file
    OR
    You can goto the project files, go to folder database -> pre_made_mysql_file -> amora-enrollment-system.sql
  ```
3. Open xampp->phpmyadmin
4. Import the mysql you downloaded


## Step 3: Generating key , and running/serving the system

1. install composer dependencies run:
   ```bash
   composer install
   ```
2. Generate key for .env file, open terminal and run:
   ```bash
   php artisan key:generate
   ```
3. Serve / Start the system, open terminal and run:
   ```bash
   php artisan serve
   ```
4. Open browser and type url:
   ```bash
   http://localhost:8000/login

   Login Credentials:
   email: test1@example.com
   password: password
   ```
5. Done! Makita na dapat ang dashboard page



