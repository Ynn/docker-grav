version: "2"
services:
  web:
    restart: always
    image : docker-grav-nginx
    build:
      context : ./nginx
      dockerfile: Dockerfile
    #ports:
       #HTTP_PORT#
       #HTTPS_PORT#
    volumes:
      - .ssh:/home/www/.ssh
      #WWW_VOLUME#
      #HTPASSWD#
      #SHARED_ACCOUNT_VOLUME#
    environment:
      - VIRTUAL_PORT=80
      #LETSENCRYPT_HOST#
      #LETSENCRYPT_EMAIL#
      #VIRTUAL_HOST#
      #LOCAL_USER_ID#
    links:
      - php
    networks:
      - www
  php:
    restart: always
    image : docker-grav-php
    build:
      context : ./php-fpm
      dockerfile: Dockerfile
    environment:
      - DEBUG=0
      #LOCAL_USER_ID#
    volumes:
      #WWW_VOLUME#
      - .ssh:/home/www/.ssh
      #SHARED_ACCOUNT_VOLUME#
    networks:
      - www
networks:
  www:
    external : true
