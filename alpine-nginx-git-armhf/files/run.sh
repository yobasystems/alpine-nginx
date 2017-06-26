#!/bin/ash
git clone --depth=1 --branch=master ${REPO} /etc/nginx/html
rm -rf /etc/nginx/html/.git
#start nginx
nginx
