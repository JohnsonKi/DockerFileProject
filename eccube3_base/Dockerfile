# 元となるDockerイメージの指定
FROM centos:7

#以下ダウンロードしたいパッケージのバージョン指定
ENV ECCUBE_VERSION=3.0.16

# ローカルのファイルをコンテナ内へコピー
COPY ./conf/ /root

RUN echo "現在パス:\n" && \
    pwd && \ 
    echo "現在作業: Time Zone変更 開始\n" && \
    cp /etc/localtime /root/old.timezone && \
    rm /etc/localtime && \
    ln -s /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    echo "現在作業: Time Zone変更 終了\n\n\n"

RUN echo "現在パス:\n" && \
    pwd && \ 
    echo "現在作業: shellをコピーし、実行権限をつける 開始\n" && \
    cp /root/entrypoint.sh /entrypoint.sh && \
    chmod 755 /entrypoint.sh && \
    echo "現在作業: shellをコピーし、実行権限をつける 終了\n\n\n"

RUN echo "現在パス:\n" && \
    pwd && \ 
    echo "現在作業: yumのキャッシュクリア 開始\n" && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    echo "現在作業: yumのキャッシュクリア 終了\n\n\n"

RUN echo "現在パス:\n" && \
    pwd && \ 
    echo "現在作業: install php php-pdo php-mysql php-pdo_pgsql php-dom php-mbstring php-gd php-xml php-fpm php-soap iproute vim unzip wget 開始\n" && \
    yum install -y php php-pdo php-mysql php-pdo_pgsql php-dom php-mbstring php-gd php-xml php-fpm php-soap iproute vim unzip wget && \
    echo "現在作業: install php php-pdo php-mysql php-pdo_pgsql php-dom php-mbstring php-gd php-xml php-fpm php-soap iproute vim unzip wget 終了\n\n\n"

RUN echo "現在パス:\n" && \
    pwd && \ 
    echo "現在作業: RPM-GPG-KEY-EPEL-7　RPMパッケージ更新 開始\n" && \
    rpm --import https://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-7 && \
    yum install -y epel-release && \
    yum repolist && \
    echo "現在作業: RPM-GPG-KEY-CentOS-7　RPMパッケージ更新 終了\n\n\n"

RUN echo "現在パス:\n" && \
    pwd && \ 
    echo "現在作業: install php-mcrypt php-apc nginx 開始\n" && \
    yum install -y php-mcrypt php-apc nginx nkf && \
    echo "現在作業: install php-mcrypt php-apc nginx 終了\n\n\n"

RUN echo "現在パス:\n" && \
    pwd && \ 
    echo "現在作業: yumのキャッシュ再度クリア 開始\n" && \
    yum clean all && \
    rm -rf /var/cache/yum && \
    echo "現在作業: yumのキャッシュ再度クリア 終了\n\n\n"

RUN echo "現在パス:\n" && \
    pwd && \ 
    echo "現在作業: 各種confファイルコピー 開始\n" && \
    cp -f /root/www.conf /etc/php-fpm.d/www.conf && \
    cp -f /root/nginx.conf /etc/nginx/nginx.conf && \
    cp -f /root/php.ini /etc/php.ini && \
    mv /root/certificates /certificates && \
    rm -rf /root/* && \
    echo "現在作業: 各種confファイルコピー 終了\n\n\n"

RUN echo "現在パス:\n" && \
    pwd && \ 
    echo "現在作業: 共有フォルダー作成 開始\n" && \
    mkdir ec-cube && \
    ls -la && \
    echo "現在作業: 共有フォルダー作成 終了\n\n\n"

RUN echo "現在パス:\n" && \
    cd /tmp && \
    pwd && \ 
    echo "現在作業: EC-CUBEダウンロード 開始\n" && \
    curl -Ss -o eccube.tar.gz https://codeload.github.com/EC-CUBE/ec-cube/tar.gz/$ECCUBE_VERSION && \
    echo "現在作業: EC-CUBEダウンロード 終了\n\n\n"

RUN echo "現在パス:\n" && \
    cd /tmp && \
    pwd && \ 
    echo "現在作業: EC-CUBE解凍 開始\n" && \
    tar -zxvf eccube.tar.gz -C ./ && \
    echo "現在作業: EC-CUBE解凍 終了\n\n\n"

RUN echo "現在パス:\n" && \
    cd /tmp && \
    pwd && \ 
    echo "現在作業: composer tool install 開始\n" && \
    curl -Ss -o composer-setup.php https://getcomposer.org/installer && \
    php composer-setup.php && \
    mv composer.phar /usr/bin/composer && \
    echo "現在作業: composer tool install 終了\n\n\n"

RUN echo "現在パス:\n" && \
    pwd && \ 
    echo "現在作業: nginx logをstdoutへリンク 開始\n" && \
    ln -sf /dev/stdout /var/log/nginx/access.log && \
    ln -sf /dev/stderr /var/log/nginx/error.log && \
    echo "現在作業: nginx logをstdoutへリンク 終了\n\n\n"

RUN echo "現在パス:\n" && \
    pwd && \ 
    echo "現在作業: ENTRYPOINT 改行コードをLFへ変換 開始\n" && \
    nkf -Lu --overwrite /entrypoint.sh && \
    echo "現在作業: ENTRYPOINT 改行コードをLFへ変換 終了\n\n\n"

# ボリュームのマウント
VOLUME /ec-cube

# 作業ディレクトリの指定
WORKDIR /ec-cube

# ポートのエクスポート
EXPOSE 80 443 3306

# コンテナー内のコマンド実行（docker run時ユーザ指定のコマンド引数が無視される）
ENTRYPOINT ["/entrypoint.sh"]
# ENTRYPOINT ["/sbin/init"]

# docker run -it --name test -p 8181:80 -v C:\MyWorkSpace\DockerShareSpace\test1:/ec-cube test:1.0
# docker run -d --privileged --name test1 -p 8080:80 -p 8443:443 -v C:\MyWorkSpace\DockerShareSpace\test1:/ec-cube test:1.0 --entrypoint /sbin/init
# nkf -Lu --overwrite /entrypoint.sh
# sed -i -e "s/;date.timezone =/date.timezone = Asia\/Tokyo/" /etc/php.ini