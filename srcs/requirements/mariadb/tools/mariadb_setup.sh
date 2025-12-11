#!/bin/bash
set -e

DATADIR="/var/lib/mysql"

mkdir -p /run/mysqld "$DATADIR"
chown -R mysql:mysql /run/mysqld "$DATADIR"

if [ ! -d "$DATADIR/mysql" ]; then
    echo ">> Initialisation de MariaDB..."
    mariadb-install-db --user=mysql --datadir="$DATADIR"

    mysqld_safe --user=mysql --datadir="$DATADIR" &

    until mysqladmin ping --silent; do
        sleep 1
    done

    mysql -uroot <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';
EOF

    mysqladmin -uroot -p"${MARIADB_ROOT_PASSWORD}" shutdown
fi

exec mysqld_safe --user=mysql --datadir="$DATADIR"