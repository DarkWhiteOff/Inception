FROM debian:11

RUN apt-get update -y
RUN apt-get install mariadb-server -y

COPY config/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/script.sh /
RUN chmod +x /script.sh

CMD ["/script.sh"]