FROM	debian:bookworm

RUN		apt update -y
RUN		apt upgrade -y
RUN		apt install nginx -y
RUN		apt install openssl -y
RUN		apt install nano -y
RUN		apt clean

RUN		mkdir -p /etc/nginx/ssl

RUN		openssl req -x509 -nodes \
		-out /etc/nginx/ssl/inception.crt \
		-keyout /etc/nginx/ssl/inception.key \
		-subj "/C=FR/ST=id/L=paris/O=42/OU=1337/CN=zamgar.42.fr/UID=zamgar"

COPY	conf/nginx.conf /etc/nginx/nginx.conf

RUN		mkdir -p /var/www/wordpress
RUN		chmod 775 /var/www/wordpress
RUN		chown -R www-data:www-data /var/www/wordpress


CMD	["nginx", "-g", "daemon off;"]