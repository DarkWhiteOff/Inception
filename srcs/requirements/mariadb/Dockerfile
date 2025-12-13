FROM debian:bookworm

RUN  apt update -y && apt upgrade -y
RUN  apt install mariadb-server -y

COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

COPY tools/mariadb_setup.sh /usr/local/bin/mariadb_setup.sh
RUN  chmod +x /usr/local/bin/mariadb_setup.sh

ENTRYPOINT  ["/usr/local/bin/mariadb_setup.sh"]