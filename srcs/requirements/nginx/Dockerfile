FROM	debian:bookworm

RUN  apt update -y && apt upgrade -y
RUN  apt install nginx openssl -y

COPY	conf/nginx.conf /etc/nginx/nginx.conf

COPY    tools/nginx_setup.sh /usr/local/bin/nginx_setup.sh
RUN     chmod +x /usr/local/bin/nginx_setup.sh

ENTRYPOINT     ["/usr/local/bin/nginx_setup.sh"]