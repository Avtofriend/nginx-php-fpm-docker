#!/bin/sh

if [ ! -d /data/htdocs ] ; then
  mkdir -p /data/htdocs
  chown :www-data /data/htdocs
fi

# start php-fpm
mkdir -p /data/logs/php-fpm
php-fpm

# start nginx
mkdir -p /data/logs/nginx
mkdir -p /data/logs/php-fpm
mkdir -p /tmp/nginx
chown nginx /tmp/nginx
nginx

/usr/sbin/crond -c /etc/crontabs -f
