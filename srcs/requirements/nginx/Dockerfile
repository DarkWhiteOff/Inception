FROM	debian:bookworm

RUN  apt update -y && apt upgrade -y
RUN  apt install nginx openssl -y

RUN		mkdir -p /etc/nginx/ssl

RUN		openssl req -x509 -nodes \
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/L=PA/O=42/CN=zamgar.42.fr"

COPY	conf/nginx.conf /etc/nginx/nginx.conf

ENTRYPOINT	["nginx", "-g", "daemon off;"]