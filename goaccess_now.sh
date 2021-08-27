#!/bin/bash
SITE=$1

mkdir /tmp/goaccess
mkdir /tmp/goaccess/$SITE

#You have to be access with SSH key... Check the path of your nginxs logs
scp your_user@your_remote_host:/var/log/nginx/$(echo $SITE)_access.log /tmp/goaccess/$SITE

echo $SITE

docker run --rm -v /tmp/goaccess/$(echo $SITE):/tmp/goaccess -v /home/usr_amcom/goaccess:/tmp/html -v /home/usr_amcom/goaccess_db/$(echo $SITE):/tmp/goaccess_db allinurl/goaccess -f /tmp/goaccess/$(echo $SITE)_access.log -o /tmp/html/$(echo $SITE).html --log-format=COMBINED --persist --restore --db-path /tmp/goaccess_db/ --keep-last=1800
