# Nginx Docker image running on Alpine Linux

[![Docker Automated build](https://img.shields.io/docker/automated/yobasystems/alpine-nginx.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/yobasystems/alpine-nginx/)
[![Docker Pulls](https://img.shields.io/docker/pulls/yobasystems/alpine-nginx.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/yobasystems/alpine-nginx/)
[![Docker Stars](https://img.shields.io/docker/stars/yobasystems/alpine-nginx.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/yobasystems/alpine-nginx/)

[![Alpine Version](https://img.shields.io/badge/Alpine%20version-v3.11.2-green.svg?style=for-the-badge)](https://alpinelinux.org/)
[![Nginx Version](https://img.shields.io/badge/Nginx%20Mainline-v1.17.7-green.svg?style=for-the-badge)](https://nginx.org/en/)
[![Nginx Version](https://img.shields.io/badge/Nginx%20Stable-v1.16.1-green.svg?style=for-the-badge)](https://nginx.org/en/)


This Docker image [(yobasystems/alpine-nginx)](https://hub.docker.com/r/yobasystems/alpine-nginx/) is based on the minimal [Alpine Linux](https://alpinelinux.org/) with version 1.17.7 of [NGINX](https://nginx.org/en/)

##### Alpine Version 3.11.2 (Released October 21, 2019)
##### NGINX Version 1.17.7 (Mainline)
##### NGINX Version 1.16.1 (Stable)

----

## What is Alpine Linux?
Alpine Linux is a Linux distribution built around musl libc and BusyBox. The image is only 5 MB in size and has access to a package repository that is much more complete than other BusyBox based images. This makes Alpine Linux a great image base for utilities and even production applications. Read more about Alpine Linux here and you can see how their mantra fits in right at home with Docker images.

## What is NGINX?
NGINX is open source software for web serving, reverse proxying, caching, load balancing, media streaming, and more. It started out as a web server designed for maximum performance and stability. In addition to its HTTP server capabilities, NGINX can also function as a proxy server for email (IMAP, POP3, and SMTP) and a reverse proxy and load balancer for HTTP, TCP, and UDP servers. [engine-ex]

## Features

* Minimal size only, minimal layers
* Memory usage is minimal on a simple install.
* Auto git clone from repo with `yobasystems/alpine-nginx:git` tag

## Architectures

* ```:amd64```, ```:x86_64``` - 64 bit Intel/AMD (x86_64/amd64)
* ```:arm64v8```, ```:aarch64``` - 64 bit ARM (ARMv8/aarch64)
* ```:arm32v7```, ```:armhf``` - 32 bit ARM (ARMv7/armhf)

#### PLEASE CHECK TAGS BELOW FOR SUPPORTED ARCHITECTURES, THE ABOVE IS A LIST OF EXPLANATION

## Tags

* ```:latest``` latest branch based on mainline (Automatic Architecture Selection)
* ```:master``` master branch usually inline with latest (Automatic Architecture Selection)
* ```:mainline``` latest branch based on mainline release (Automatic Architecture Selection)
* ```:stable``` stable branch usually inline with latest stable release (Automatic Architecture Selection)
* ```:git``` latest branch with git based on mainline (Automatic Architecture Selection)
* ```:git-ssh``` latest branch with git and ssh auth for private repo based on mainline (Automatic Architecture Selection)
* ```:amd64```, ```:x86_64``` amd64 based on latest tag but amd64 architecture
* ```:git-amd64```, ```:git-x86_64``` amd64 based on latest tag but amd64 architecture and includes git
* ```:git-ssh-amd64```, ```:git-ssh-x86_64``` amd64 based on latest tag but amd64 architecture and includes git and ssh auth for private repo
* ```:aarch64```, ```:arm64v8``` Armv8 based on latest tag but arm64 architecture
* ```:aarch64-git```, ```:git-arm64v8``` Armv8 based on latest tag but arm64 architecture and includes git
* ```:aarch64-git-ssh```, ```:git-ssh-arm64v8``` Armv8 based on latest tag but arm64 architecture and includes git and ssh auth for private repo
* ```:armhf```, ```:arm32v7``` Armv7 based on latest tag but arm architecture
* ```:git-armhf```, ```:git-arm32v7``` Armv7 based on latest tag but arm architecture and includes git
* ```:git-ssh-armhf```, ```:git-ssh-arm32v7``` Armv7 based on latest tag but arm architecture and includes git and ssh auth for private repo

## Layers & Sizes

![Version](https://img.shields.io/badge/version-amd64-blue.svg?style=for-the-badge)
![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/yobasystems/alpine-nginx/amd64.svg?style=for-the-badge)
![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/yobasystems/alpine-nginx/amd64.svg?style=for-the-badge)

![Version](https://img.shields.io/badge/version-aarch64-blue.svg?style=for-the-badge)
![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/yobasystems/alpine-nginx/aarch64.svg?style=for-the-badge)
![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/yobasystems/alpine-nginx/aarch64.svg?style=for-the-badge)

![Version](https://img.shields.io/badge/version-armhf-blue.svg?style=for-the-badge)
![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/yobasystems/alpine-nginx/armhf.svg?style=for-the-badge)
![MicroBadger Size (tag)](https://img.shields.io/microbadger/image-size/yobasystems/alpine-nginx/armhf.svg?style=for-the-badge)

## Environment Variables:

* `URL`: specify the url with that nginx will listen on. Default to localhost.

## HTML content

To alter the HTML content that nginx serves up (add your website files), add the following to your Dockerfile:

```
ADD /path/to/content /etc/nginx/html
```

index.html is the default, but that's easily changed (see below).

### Nginx configuration

A basic nginx configuration is supplied with this image. But it's easy to overwrite:

- Create your own `nginx.conf`.
- In your `Dockerfile`, make sure your `nginx.conf` file is copied to `/etc/nginx/nginx.conf`.

**Make sure you start nginx without daemon mode, by including `daemon off;` in your nginx configuration, otherwise the container will constantly exit right after nginx starts.**

## Creating an instance

To use this image include `FROM yobasystems/alpine-nginx` at the top of your Dockerfile.

```bash
docker run --name webapp -p 80:80 -p 443:443 -e URL=www.example.co.uk yobasystems/alpine-nginx
```

To use persistent data , then use the volume var:

```bash
docker run --name webapp -p 80:80 -p 443:443 -e URL=www.example.co.uk -v /app/www:/etc/nginx/html yobasystems/alpine-nginx
```


Nginx logs (access and error logs) output to `stdout` and `stderr`

## Docker Compose example:

```yalm
version: '2'
services:
webapp:
  image: yobasystems/alpine-nginx
  environment:
    URL: www.example.co.uk
  expose:
    - "80"
    - "443"
  volumes:
    - /app/www:/etc/nginx/html
  domainname: www.example.co.uk
  restart: always
```

## Docker Compose example (Git):

```yalm
version: '2'
services:
webapp:
  image: yobasystems/alpine-nginx:git
  environment:
    URL: www.example.co.uk
    REPO: https://yobasystems@bitbucket.org/yobasystems/default-index.git
  expose:
    - "80"
    - "443"
  volumes:
    - /app/www:/etc/nginx/html
  domainname: www.example.co.uk
  restart: always
```

## Source Repository

* [Bitbucket - yobasystems/alpine-nginx](https://bitbucket.org/yobasystems/alpine-nginx/)

* [Github - yobasystems/alpine-nginx](https://github.com/yobasystems/alpine-nginx)

## Links

* [Yoba Systems](https://www.yobasystems.co.uk/)

* [Dockerhub - yobasystems](https://hub.docker.com/u/yobasystems/)

* [Quay.io - yobasystems](https://quay.io/organization/yobasystems)

## Donation

```
BITCOIN: bc1ql0heex0jxh0yj5cucc83a3x6c6rxuq6x9zk07g
ETHEREUM: 0x6b707391c60d50E4E414a143446C0b8eF9A2d1c4
STELLAR: GAREZZW36KF2IT2EJW6LG5HH4XT3QIMWCHMCGEBC6V3AP3EFJCORRZIY
XRP: rsaEp3bh3LrjVHqrcyLgbUb6QUQbBogzR3
ZCASH: t1MuAY2vR17vDK3BgCAtf8ZdXsCiBw3zkU6
```
