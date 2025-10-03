#!/bin/sh

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout \
/etc/ssl/private/nginx-selfsigned.key -out \
/etc/ssl/certs/nginx-selfsigned.crt -subj \
"/C=FR/L=PA/O=42/OU=student/CN=zamgar"

nginx -g "daemon off;"