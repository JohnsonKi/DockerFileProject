#!/bin/bash

#Laravel
export PATH="~/.composer/vendor/bin:$PATH"
cd /usr/src
laravel new myapp
chown -R nginx:nginx /usr/src/myapp
chmod -R 755 /usr/src/myapp

# php-fpm start
systemctl enable php-fpm
systemctl start php-fpm

#nginx start
systemctl enable nginx
systemctl start nginx

#mysql start
systemctl enable mysqld.service
systemctl start mysqld.service

#stop firewall
# systemctl stop firewalld
# systemctl disable firewalld

# MySQL configure
# grep 'temporary password' /var/log/mysqld.log
# mysql_secure_installation

