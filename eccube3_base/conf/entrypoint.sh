#!/bin/bash

# ec-cube-3.0.15
if [[ ! -d /ec-cube/src ]]; then
  cd /tmp
	rm -rf /tmp/ec-cube-$ECCUBE_VERSION
	tar -zxvf eccube.tar.gz -C /tmp &&
	mv /tmp/ec-cube-${ECCUBE_VERSION}/* /ec-cube
fi

# composer
if [[ ! -d /ec-cube/vendor ]]; then
	cd /ec-cube &&
	composer install
fi

# install
installfile="/ec-cube/html/install.php"
if [ -f "$installfile" ]
then
	echo "$file found."
	cd /ec-cube
	# export DBSERVER=172.17.0.2
	# export DBNAME=kitest
	# export DBUSER=root
	# export DBPASS=password
  php eccube_install.php mysql none
  rm $installfile
	chown -R nobody *
fi

# run
php-fpm -D && /usr/sbin/nginx -g "daemon off;"
# ps aux | grep -e nginx -e php-fpm