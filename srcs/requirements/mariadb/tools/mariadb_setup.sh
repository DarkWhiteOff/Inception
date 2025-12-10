#!/bin/bash
set -e

DATADIR="/var/lib/mysql"

echo ">> Préparation des répertoires..."
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
mkdir -p "$DATADIR"
chown -R mysql:mysql "$DATADIR"

# 1) Initialiser le datadir si c'est la première fois (volume vide)
if [ ! -d "$DATADIR/mysql" ]; then
    echo ">> Datadir vide, initialisation de MariaDB..."
    mariadb-install-db --user=mysql --datadir="$DATADIR" --skip-test-db
fi

echo ">> Lancement de MariaDB en arrière-plan pour configuration..."
mysqld_safe --user=mysql --datadir="$DATADIR" &
MYSQL_PID=$!

echo ">> Attente que MariaDB réponde..."
until mysqladmin ping -h "localhost" --silent; do
    echo "Waiting for MariaDB..."
    sleep 1
done

echo ">> MariaDB est UP, configuration de la base et des users..."

mysql -uroot <<EOF
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO '${MARIADB_USER}'@'%';
FLUSH PRIVILEGES;
EOF

echo ">> Configuration terminée, arrêt de MariaDB temporaire..."
mysqladmin -uroot -p"${MARIADB_ROOT_PASSWORD}" shutdown

echo ">> Relance de MariaDB au premier plan..."
exec mysqld_safe --user=mysql --datadir="$DATADIR"
