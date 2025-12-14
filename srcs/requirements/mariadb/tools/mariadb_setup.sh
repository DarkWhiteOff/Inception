#!/bin/bash
set -e

DATADIR="/var/lib/mysql"

mkdir -p /run/mysqld "${DATADIR}"
chown -R mysql /run/mysqld "${DATADIR}"

INIT_FL=""

if [ ! -d "${DATADIR}/mysql" ]; then
    echo ">> Initialisation de MariaDB..."
    mariadb-install-db

    cat > /tmp/init.sql <<EOF
DELETE FROM mysql.user WHERE User='';

ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';

CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';

FLUSH PRIVILEGES;
EOF

    INIT_FL="--init-file=/tmp/init.sql"
fi

exec mariadbd $INIT_FL