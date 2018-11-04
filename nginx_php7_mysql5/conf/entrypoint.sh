#!/bin/bash

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
