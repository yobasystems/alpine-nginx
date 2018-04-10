# Nginx Docker image running on Alpine Linux

[![Docker Layers](https://img.shields.io/badge/docker%20layers-4-blue.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-nginx/) [![Docker Size](https://img.shields.io/badge/docker%20size-6.6%20MB-blue.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-nginx/) [![Docker Stars](https://img.shields.io/docker/stars/yobasystems/alpine-nginx.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-nginx/) [![Docker Pulls](https://img.shields.io/docker/pulls/yobasystems/alpine-nginx.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-nginx/)

[![Alpine Version](https://img.shields.io/badge/alpine%20version-v3.7.0-green.svg?maxAge=2592000?style=flat-square)](http://alpinelinux.org/) [![Nginx Version](https://img.shields.io/badge/nginx%20version-v1.13.12-green.svg?maxAge=2592000?style=flat-square)](http://nginx.org/en/)



This Docker image [(yobasystems/alpine-nginx)](https://hub.docker.com/r/yobasystems/alpine-nginx/) is based on the minimal [Alpine Linux](http://alpinelinux.org/) with version 1.13.12 of [NGINX](http://nginx.org/en/)

##### Alpine Version 3.7.0 (Released Jun 17, 2017)
##### NGINX Version 1.13.12

----

## What is Alpine Linux?
Alpine Linux is a Linux distribution built around musl libc and BusyBox. The image is only 5 MB in size and has access to a package repository that is much more complete than other BusyBox based images. This makes Alpine Linux a great image base for utilities and even production applications. Read more about Alpine Linux here and you can see how their mantra fits in right at home with Docker images.

## What is NGINX?
NGINX is open source software for web serving, reverse proxying, caching, load balancing, media streaming, and more. It started out as a web server designed for maximum performance and stability. In addition to its HTTP server capabilities, NGINX can also function as a proxy server for email (IMAP, POP3, and SMTP) and a reverse proxy and load balancer for HTTP, TCP, and UDP servers. [engine-ex]

## Features

  * Minimal size only
    * 10 MB and only 4 layers
  * Memory usage is minimal on a simple install
  * Auto git clone from repo with yobasystems/alpine-nginx:git docker image tag


## Architectures

* ```:amd64```, ```:latest``` - 64 bit Intel/AMD (x86_64/amd64)
* ```:i386```, ```:x86``` - 32 bit Intel/AMD (x86/i686)
* ```:arm64v8```, ```:aarch64``` - 64 bit ARM (ARMv8/aarch64)
* ```:arm32v7```, ```:armhf``` - 32 bit ARM (ARMv7/armhf)

#### PLEASE CHECK TAGS BELOW FOR SUPPORTED ARCHITECTURES, THE ABOVE IS A LIST OF EXPLANATION

## Tags

* ```:latest```, ```:amd64``` latest branch based on amd64
* ```:master``` master branch usually inline with latest
* ```:git``` latest branch with git
* ```:git-ssh``` latest branch with git and ssh auth
* ```:v0.0.0``` version number related to docker version
* ```:armhf```, ```:arm32v7``` Armv7 based on latest tag but arm architecture
* ```:armhf-git```, ```:arm32v7-git``` Armv7 based on latest tag but arm architecture and includes git
* ```:armhf-git-ssh```, ```:arm32v7-git-ssh``` Armv7 based on latest tag but arm architecture and includes git and ssh auth

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
