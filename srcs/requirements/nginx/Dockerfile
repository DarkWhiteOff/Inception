FROM debian:12

RUN apt update && apt upgrade -y
RUN apt install nginx -y
RUN apt install openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr/UID=login"

RUN rm -f /etc/nginx/nginx.conf
COPY config/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]