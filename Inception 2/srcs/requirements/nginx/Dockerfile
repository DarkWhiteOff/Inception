FROM debian:11

RUN apt update && apt upgrade -y
RUN apt install nginx -y
RUN apt install openssl -y

COPY config/default /etc/nginx/sites-available/default

COPY tools/script.sh /
RUN chmod +x /script.sh

CMD ["/script.sh"]