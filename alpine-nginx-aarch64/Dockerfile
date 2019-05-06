FROM yobasystems/alpine:3.9.3-aarch64

ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="Dominic Taylor <dominic@yobasystems.co.uk>" \
    architecture="arm64v8/aarch64" \
    nginx-version="1.16.0" \
    alpine-version="3.9.3" \
    build="06-May-2019" \
    org.opencontainers.image.title="alpine-nginx" \
    org.opencontainers.image.description="Nginx Docker image running on Alpine Linux" \
    org.opencontainers.image.authors="Dominic Taylor <dominic@yobasystems.co.uk>" \
    org.opencontainers.image.vendor="Yoba Systems" \
    org.opencontainers.image.version="v1.16.0" \
    org.opencontainers.image.url="https://hub.docker.com/r/yobasystems/alpine-nginx/" \
    org.opencontainers.image.source="https://github.com/yobasystems/alpine-nginx" \
    org.opencontainers.image.revision=$VCS_REF \
    org.opencontainers.image.created=$BUILD_DATE

ENV NGINX_VERSION=1.16.0

RUN \
  build_pkgs="build-base linux-headers openssl-dev pcre-dev wget zlib-dev" && \
  runtime_pkgs="ca-certificates openssl pcre zlib tzdata git" && \
  apk --no-cache add ${build_pkgs} ${runtime_pkgs} && \
  cd /tmp && \
  wget https://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz && \
  tar xzf nginx-${NGINX_VERSION}.tar.gz && \
  cd /tmp/nginx-${NGINX_VERSION} && \
  ./configure \
    --prefix=/etc/nginx \
    --sbin-path=/usr/sbin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --error-log-path=/var/log/nginx/error.log \
    --http-log-path=/var/log/nginx/access.log \
    --pid-path=/var/run/nginx.pid \
    --lock-path=/var/run/nginx.lock \
    --http-client-body-temp-path=/var/cache/nginx/client_temp \
    --http-proxy-temp-path=/var/cache/nginx/proxy_temp \
    --http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
    --http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
    --http-scgi-temp-path=/var/cache/nginx/scgi_temp \
    --user=nginx \
    --group=nginx \
    --with-http_ssl_module \
    --with-http_realip_module \
    --with-http_addition_module \
    --with-http_sub_module \
    --with-http_dav_module \
    --with-http_flv_module \
    --with-http_mp4_module \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_random_index_module \
    --with-http_secure_link_module \
    --with-http_stub_status_module \
    --with-http_auth_request_module \
    --with-mail \
    --with-mail_ssl_module \
    --with-file-aio \
    --with-threads \
    --with-stream \
    --with-stream_ssl_module \
    --with-stream_realip_module \
    --with-http_slice_module \
    --with-http_v2_module && \
  make && \
  make install && \
  sed -i -e 's/#access_log  logs\/access.log  main;/access_log \/dev\/stdout;/' -e 's/#error_log  logs\/error.log  notice;/error_log stderr notice;/' /etc/nginx/nginx.conf && \
  addgroup -S nginx && \
  adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx && \
  rm -rf /tmp/* && \
  apk del ${build_pkgs} && \
  rm -rf /var/cache/apk/*

COPY files/index.html /etc/nginx/html/
COPY files/nginx.conf /etc/nginx/nginx.conf

VOLUME ["/var/cache/nginx"]

EXPOSE 80 443

CMD ["nginx"]
