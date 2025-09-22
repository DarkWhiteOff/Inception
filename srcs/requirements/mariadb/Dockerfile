FROM debian:13.0

RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y

RUN rm -f /etc/mysql/mariadb.conf.d/50-server.cnf
COPY config/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/db_user.sh /db_user.sh
RUN chmod -R +x /db_user.sh

ENTRYPOINT ["sh", "db_user.sh"]

EXPOSE 3306