FROM debian:bullseye

RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y

COPY config/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/db_user.sh /tools/
RUN chmod +x /tools/db_user.sh
RUN sh /tools/db_user.sh