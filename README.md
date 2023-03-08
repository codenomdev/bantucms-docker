# Bantucms Dockerization
## Introduction
### Whats is Bantucms
Bantucms is a CMS framework built on top of the hottest opensource technologies such as Laravel, a PHP framework and Vue.js, a progressive Javascript framework.

Bantucms is a viable option to reduce your time, cost and workforce for building online website or migrating from a physical project to an online platform.

It is suitable for all small or large Website business demands using a simple set-up procedure. Built on top of Laravel and equipped with an easy product information management.

[See more about Bantucms](https://devdocs.codenom.com/1.x/installation-guide/)

## System Requirements
- System/Server requirements of Bantucms are mentioned [here](https://devdocs.codenom.com/1.x/installation-guide/requirements.html). Using Docker, these requirements will be fulfilled by docker images of apache & mysql, and our application will run in a multi-tier architecture.
- Install latest version of Docker and Docker Compose if it is not already installed. Docker supports Linux, MacOS and Windows Operating System. Click [Docker](https://docs.docker.com/get-docker/) and [Docker Compose](https://docs.docker.com/compose/install/) to find their installation guide.

## Installation
- Adjust your Apache, MySQL and PHPMyAdmin port.

  ~~~yml
  version: '3.1'

  services:
      bantucms-php-apache:
          build:
              args:
                  container_project_path: /var/www/html/
                  uid: 1428 # add your uid here
                  user: $USER
              context: .
              dockerfile: ./Dockerfile
          image: bantucms-php-apache
          ports:
              - 80:80 # adjust your port here, if you want to change
          volumes:
              - ./workspace/:/var/www/html/

      bantucms-mysql:
          image: mysql:8.0
          command: --default-authentication-plugin=mysql_native_password
          restart: always
          environment:
              MYSQL_ROOT_HOST: '%'
              MYSQL_ROOT_PASSWORD: root
          ports:
              - 3306:3306 # adjust your port here, if you want to change
          volumes:
              - ./.configs/mysql-data:/var/lib/mysql/

      bantucms-phpmyadmin:
          image: phpmyadmin:latest
          restart: always
          environment:
              PMA_HOST: bantucms-mysql
              PMA_USER: root
              PMA_PASSWORD: root
          ports:
              - 8080:80 # adjust your port here, if you want to change

  volumes:
      mysql-data:
  ~~~

- Run the below command and everything setup for you,

  ~~~sh
  sh setup.sh
  ~~~

## After installation

- To log in as admin.

  ~~~text
  http(s)://your_server_endpoint/admin_panel/login

  Email: admin@example.com
  Password: admin123
  ~~~

- To log in as customer. You can directly register as customer and then login.

  ~~~text
  http(s):/your_server_endpoint/customer/register
  ~~~