FROM debian:13.0

RUN apt update && apt upgrade -y
RUN apt install nginx -y
RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"
# RUN openssl req -newkey rsa:4096 -days 42 -nodes -x509 \
# -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=zamgar.42.fr/UID=zamgar" \
# -out /etc/ssl/certs/inception.crt \
# -keyout /etc/ssl/private/inception.key

RUN rm -f /etc/nginx/nginx.conf
COPY config/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

CMD [ "nginx", "-g", "daemon off;" ]