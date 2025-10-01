# #!/bin/sh

service mysql start;
# mariadbd-safe --datadir=/var/lib/mysql &
mysql -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
mysql -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -u root -p$SQL_ROOT_PASSWORD shutdown
exec mysqld_safe




# #!/bin/sh
# set -e

# MYSQL_SOCK="/run/mysqld/mysqld.sock"

# # ... keep your existing code above ...

# # Wait loop unchanged
# # until mysqladmin ping -h 127.0.0.1 --silent; do ...; done

# # ⬇️ CHANGE THIS PART ONLY ⬇️
# # Use socket auth for the initial setup as root (no password yet)
# : "${SQL_DATABASE:=wordpress}"
# : "${SQL_USER:=wpuser}"
# : "${SQL_PASSWORD:=wppass}"
# : "${SQL_ROOT_PASSWORD:=rootpass}"

# echo "Configuring database and users..."
# mysql --protocol=socket -uroot -S "$MYSQL_SOCK" -e "CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;"
# mysql --protocol=socket -uroot -S "$MYSQL_SOCK" -e "CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';"
# mysql --protocol=socket -uroot -S "$MYSQL_SOCK" -e "GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';"
# mysql --protocol=socket -uroot -S "$MYSQL_SOCK" -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';"
# mysql --protocol=socket -uroot -S "$MYSQL_SOCK" -e "FLUSH PRIVILEGES;"

# # Shut down the temp server (use socket; password now set)
# echo "Shutting down temporary server..."
# mysqladmin --protocol=socket -uroot -p"${SQL_ROOT_PASSWORD}" -S "$MYSQL_SOCK" shutdown

# # ... keep the rest (final exec mysqld in foreground) ...
# exec mysqld --user=mysql --datadir=/var/lib/mysql --socket="$MYSQL_SOCK" --pid-file=/run/mysqld/mysqld.pid
