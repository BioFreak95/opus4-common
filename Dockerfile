FROM ubuntu:16.04

# First update Ubuntu
RUN apt-get update

# Install System-Packages
RUN apt-get install -y composer

# Install PHP with necessary packages for Opus4
RUN apt-get install -y php\
    php-cli\
    php-common\
    php-dev\
    php-xdebug
