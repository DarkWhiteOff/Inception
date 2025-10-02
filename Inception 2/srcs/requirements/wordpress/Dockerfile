FROM debian:11

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt update -y
RUN apt upgrade -y
RUN apt install php-fpm php-mysql -y
RUN apt install curl -y

COPY tools/script.sh /
RUN chmod +x /script.sh

CMD ["/script.sh"]