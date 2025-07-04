# Nginx container image running on Alpine Linux

[![Docker Automated build](https://img.shields.io/docker/automated/yobasystems/alpine-nginx.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/yobasystems/alpine-nginx/)
[![Docker Pulls](https://img.shields.io/docker/pulls/yobasystems/alpine-nginx.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/yobasystems/alpine-nginx/)
[![Docker Stars](https://img.shields.io/docker/stars/yobasystems/alpine-nginx.svg?style=for-the-badge&logo=docker)](https://hub.docker.com/r/yobasystems/alpine-nginx/)

[![Alpine Version](https://img.shields.io/badge/Alpine%20version-v3.22.0-green.svg?style=for-the-badge)](https://alpinelinux.org/)
[![Nginx Version](https://img.shields.io/badge/Nginx%20Mainline-v1.27.5-green.svg?style=for-the-badge)](https://nginx.org/en/)
[![Nginx Version](https://img.shields.io/badge/Nginx%20Stable-v1.28.0-green.svg?style=for-the-badge)](https://nginx.org/en/)


This Container image [(yobasystems/alpine-nginx)](https://hub.docker.com/r/yobasystems/alpine-nginx/) is based on the minimal [Alpine Linux](https://alpinelinux.org/) with version 1.27.5 of [NGINX](https://nginx.org/en/)


### Alpine Version 3.22.0 (Released 2025-05-30)
##### NGINX Version 1.27.5 (Mainline)
##### NGINX Version 1.28.0 (Stable)

----


## Table of Contents

- [What is Alpine Linux?](#what-is-alpine-linux)
- [Features](#features)
- [Architectures](#architectures)
- [Tags](#tags)
- [Layers & Sizes](#layers--sizes)
- [How to use this image](#how-to-use-this-image)
- [Image contents & Vulnerability analysis](#image-contents--vulnerability-analysis)
- [Source Repositories](#source-repositories)
- [Container Registries](#container-registries)
- [Links](#links)
- [Donation](#donation)


## 🏔️ What is Alpine Linux?
Alpine Linux is a Linux distribution built around musl libc and BusyBox. The image is only 5 MB in size and has access to a package repository that is much more complete than other BusyBox based images. This makes Alpine Linux a great image base for utilities and even production applications. Read more about Alpine Linux here and you can see how their mantra fits in right at home with Container images.

## What is NGINX?
NGINX is open source software for web serving, reverse proxying, caching, load balancing, media streaming, and more. It started out as a web server designed for maximum performance and stability. In addition to its HTTP server capabilities, NGINX can also function as a proxy server for email (IMAP, POP3, and SMTP) and a reverse proxy and load balancer for HTTP, TCP, and UDP servers. [engine-ex]

## ✨ Features

* Minimal size only, minimal layers
* Memory usage is minimal on a simple install.
* Auto git clone from repo with `yobasystems/alpine-nginx:git` tag or `yobasystems/alpine-nginx:git-ssh`

## 🏗️ Architectures

* ```:amd64```, ```:x86_64``` - 64 bit Intel/AMD (x86_64/amd64)
* ```:arm64v8```, ```:aarch64``` - 64 bit ARM (ARMv8/aarch64)
* ```:arm32v7```, ```:armhf``` - 32 bit ARM (ARMv7/armhf)

#### 📝 PLEASE CHECK TAGS BELOW FOR SUPPORTED ARCHITECTURES, THE ABOVE IS A LIST OF EXPLANATION

## 🏷️ Tags

* ```:latest``` latest branch based on mainline (Automatic Architecture Selection)
* ```:main``` main branch usually inline with latest (Automatic Architecture Selection)
* ```:mainline``` latest branch based on mainline release (Automatic Architecture Selection)
* ```:stable``` stable branch usually inline with latest stable release (Automatic Architecture Selection)
* ```:git``` latest branch with git based on mainline (Automatic Architecture Selection)
* ```:git-ssh``` latest branch with git and ssh auth for private repo based on mainline (Automatic Architecture Selection)
* ```:amd64```, ```:x86_64``` amd64 based on latest tag but amd64 architecture
* ```:amd64-git```, ```:x86_64-git``` amd64 based on latest tag but amd64 architecture and includes git
* ```:amd64-git-ssh```, ```:-x86_64-git-ssh``` amd64 based on latest tag but amd64 architecture and includes git and ssh auth for private repo
* ```:aarch64```, ```:arm64v8``` Armv8 based on latest tag but arm64 architecture
* ```:aarch64-git```, ```:arm64v8-git``` Armv8 based on latest tag but arm64 architecture and includes git
* ```:aarch64-git-ssh```, ```:arm64v8-git-ssh``` Armv8 based on latest tag but arm64 architecture and includes git and ssh auth for private repo
* ```:armhf```, ```:arm32v7``` Armv7 based on latest tag but arm architecture
* ```:armhf-git```, ```:arm32v7-git``` Armv7 based on latest tag but arm architecture and includes git
* ```:armhf-git-ssh```, ```:arm32v7-git-ssh``` Armv7 based on latest tag but arm architecture and includes git and ssh auth for private repo

## 📏 Layers & Sizes

![Version](https://img.shields.io/badge/version-amd64-blue.svg?style=for-the-badge)
![Docker Image Version (tag)](https://img.shields.io/docker/v/yobasystems/alpine-nginx/amd64.svg?style=for-the-badge)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/yobasystems/alpine-nginx/amd64.svg?style=for-the-badge)

![Version](https://img.shields.io/badge/version-aarch64-blue.svg?style=for-the-badge)
![Docker Image Version (tag)](https://img.shields.io/docker/v/yobasystems/alpine-nginx/aarch64.svg?style=for-the-badge)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/yobasystems/alpine-nginx/aarch64.svg?style=for-the-badge)

![Version](https://img.shields.io/badge/version-armhf-blue.svg?style=for-the-badge)
![Docker Image Version (tag)](https://img.shields.io/docker/v/yobasystems/alpine-nginx/armhf.svg?style=for-the-badge)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/yobasystems/alpine-nginx/armhf.svg?style=for-the-badge)


## 🚀 How to use this image
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

## 🔍 Image contents & Vulnerability analysis

| PACKAGE NAME          | PACKAGE VERSION | VULNERABILITIES |
|-----------------------|-----------------|-----------------|


## 📚 Source Repositories

* [Github - yobasystems/alpine-nginx](https://github.com/yobasystems/alpine-nginx)
* [Gitlab - yobasystems/alpine-nginx](https://gitlab.com/yobasystems/alpine-nginx)
* [Bitbucket - yobasystems/alpine-nginx](https://bitbucket.org/yobasystems/alpine-nginx/)


## 🐳 Container Registries

* [Dockerhub - yobasystems/alpine-nginx](https://hub.docker.com/r/yobasystems/alpine-nginx/)
* [Quay.io - yobasystems/alpine-nginx](https://quay.io/repository/yobasystems/alpine-nginx)
* [GHCR - yobasystems/alpine-nginx](https://ghcr.io/yobasystems/alpine-nginx)


## 🔗 Links

* [Yoba Systems](https://yoba.systems/)
* [Github - Yoba Systems](https://github.com/yobasystems/)
* [Dockerhub - Yoba Systems](https://hub.docker.com/u/yobasystems/)
* [Quay.io - Yoba Systems](https://quay.io/organization/yobasystems)
* [GHCR - Yoba Systems](https://ghcr.io/yobasystems)
* [Maintainer - Dominic Taylor](https://github.com/dominictayloruk)