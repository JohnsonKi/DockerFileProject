FROM centos:centos7

COPY ./conf/ /root

RUN echo "Centos Version:" && \
    cat /etc/redhat-release

RUN echo "GPG Key Import" && \
    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

RUN echo "yum update -y" && \
    yum update -y

RUN echo "Import the public key Of ELRepo Project" && \
    rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7

RUN echo "add epel repository" && \
    rpm -Uvh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm

RUN echo "Import the public key Of REMI Project" && \
    rpm --import https://rpms.remirepo.net/RPM-GPG-KEY-remi

RUN echo "add remi repository" && \
    rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-7.rpm

RUN echo "list enable yum repository" && \
    yum repolist enabled

RUN echo "Library Install" && \
    yum install -y --enablerepo=remi,remi-php72 php php-devel php-mbstring php-gd php-pdo php-xml php-zip php-mysqlnd php-fpm

RUN echo "Composer Install" && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

RUN echo "Work Directory(/usr/src/myapp) Create:" && \
    mkdir -p /usr/src

RUN echo "PHP Version:" && \
    php -v

RUN echo "Configure php.ini" && \
    cp -f /root/php.ini /etc/

RUN echo "Composer version" && \
    composer --version

RUN echo "add MySQL repository" && \
    yum localinstall -y http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm

RUN echo "MySQL Install" && \
    yum install -y mysql-community-server

RUN echo "Configure my.cnf" && \
    cp -f /root/my.cnf /etc

RUN echo "MySQL version:" && \
    mysql --version

RUN echo "Nginx Install" && \
    cp -f /root/nginx.repo /etc/yum.repos.d/ && \
    yum install -y --enablerepo=nginx nginx

RUN echo "Nginx Version:" && \
    nginx -V

RUN echo "Git Install" && \
    yum install -y git

RUN echo "Git Version:" && \
    git --version

RUN echo "Configure PHP-FPM" && \
    cp -f /root/www.conf /etc/php-fpm.d/

RUN echo "Configure Nginx" && \
    cp -f /root/nginx.conf /etc/nginx/ && \
    cp -f /root/default.conf /etc/nginx/conf.d/

RUN echo "Laravel Install" && \
    composer global require laravel/installer

VOLUME /usr/src

WORKDIR /usr/src

EXPOSE 80 443 3306

# ENTRYPOINT ["/entrypoint.sh"]

# docker run -d --privileged --name laravel -p 8001:80 laravel:1.0 /sbin/init

