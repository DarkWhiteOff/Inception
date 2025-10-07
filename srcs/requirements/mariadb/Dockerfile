FROM debian:12

RUN apt update && apt upgrade -y
RUN apt install mariadb-server -y

RUN rm -f /etc/mysql/mariadb.conf.d/50-server.cnf
COPY config/mariadb.conf /etc/mysql/mariadb.conf.d/50-server.cnf

###
# RUN mkdir -p /run/mysqld /var/lib/mysql \
#  && chown -R mysql:mysql /run/mysqld /var/lib/mysql \
#  && chmod 775 /run/mysqld
# ##

COPY tools/db_user.sh /db_user.sh
RUN chmod +x /db_user.sh

ENTRYPOINT ["sh", "db_user.sh"]

EXPOSE 3306