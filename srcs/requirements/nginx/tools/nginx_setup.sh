#!/bin/bash
set -e

mkdir -p /etc/nginx/ssl

openssl req -x509 -nodes \
    -out /etc/nginx/ssl/inception.crt \
    -keyout /etc/nginx/ssl/inception.key \
    -subj "/C=FR/L=PA/O=42/CN=${DOMAIN_NAME}"  

exec nginx -g 'daemon off;'