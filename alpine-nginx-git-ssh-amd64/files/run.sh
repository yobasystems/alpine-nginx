#!/bin/ash
#add ssh private key for auth to git service of choice
mkdir -p ~/.ssh
echo "${SSH_PRIVATE_KEY}" | tr -d '\r' > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
#clone repo with passwordless auth
git clone --depth=1 --branch=master ${REPO} /etc/nginx/html
rm -rf /etc/nginx/html/.git
#start nginx
nginx
