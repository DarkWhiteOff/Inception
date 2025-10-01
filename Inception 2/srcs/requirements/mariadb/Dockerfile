FROM debian:buster

RUN apt update && apt upgrade -y

RUN rm -f /etc/mysql/mariadb.conf.d/50-server.cnf
COPY config/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/db_user.sh /db_user.sh
RUN chmod +x /db_user.sh

ENTRYPOINT ["sh", "db_user.sh"]