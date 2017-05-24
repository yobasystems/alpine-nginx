# Nginx Docker image running on Alpine Linux

[![Docker Layers](https://img.shields.io/badge/docker%20layers-4-blue.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-nginx/) [![Docker Size](https://img.shields.io/badge/docker%20size-6.6%20MB-blue.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-nginx/) [![Docker Stars](https://img.shields.io/docker/stars/yobasystems/alpine-nginx.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-nginx/) [![Docker Pulls](https://img.shields.io/docker/pulls/yobasystems/alpine-nginx.svg?maxAge=2592000?style=flat-square)](https://hub.docker.com/r/yobasystems/alpine-nginx/)

[![Alpine Version](https://img.shields.io/badge/alpine%20version-v3.5-green.svg?maxAge=2592000?style=flat-square)](http://alpinelinux.org/) [![Nginx Version](https://img.shields.io/badge/nginx%20version-v1.13.0-green.svg?maxAge=2592000?style=flat-square)](http://nginx.org/en/)



This Docker image [(yobasystems/alpine-nginx)](https://hub.docker.com/r/yobasystems/alpine-nginx/) is based on the minimal [Alpine Linux](http://alpinelinux.org/) with version 1.13.0 of [Nginx](http://nginx.org/en/)

## Features

  * Minimal size only
    * 9 MB and only 4 layers
    * 18 MB and only 5 layers :git version
    * 8 MB and 4 layers armhf version
    * 16 MB and 5 layers armhf-git version
  * Memory usage is minimal on a simple install
  * Auto git clone from repo with yobasystems/alpine-nginx:git docker image tag
  * Armv7 (armhf) version with ```:armhf``` tag
  * Armv7 (armhf) version with git ```:armhf-git``` tag

## Tags

  * ```:latest``` latest nginx & alpine
  * ```:master``` master branch usually inline with latest
  * ```:git``` latest branch with git which auto pulls repo upon container start
  * ```:v0.0.0``` version number related to nginx version
  * ```:armhf``` Armv7 based on latest tag but arm architecture
  * ```:armhf-git``` Armv7 based on latest tag but arm architecture and includes Git

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

## Docker Compose example:

```yalm
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
