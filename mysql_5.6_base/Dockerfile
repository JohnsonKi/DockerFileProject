FROM centos:centos7

COPY ./conf/ /root

RUN echo "Centos Version:" && \
    cat /etc/redhat-release

RUN echo "GPG Key Import" && \
    rpm --import /etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7

RUN echo "yum update -y" && \
    yum update -y

RUN echo "add MySQL repository" && \
    yum localinstall -y http://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm

RUN echo "MySQL Install" && \
    yum install -y mysql-community-server

RUN echo "Configure my.cnf" && \
    cp -f /root/my.cnf /etc

RUN echo "MySQL version:" && \
    mysql --version

VOLUME /usr/src

WORKDIR /usr/src

EXPOSE 80 443 3306

# ENTRYPOINT ["/entrypoint.sh"]

# docker run -d --privileged --name laravel -p 8001:80 laravel:1.0 /sbin/init

