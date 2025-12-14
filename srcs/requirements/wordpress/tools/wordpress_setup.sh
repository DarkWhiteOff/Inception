#!/bin/bash
set -e

chown -R www-data /var/www/wordpress

until mariadb -h mariadb -u"${MARIADB_USER}" -p"${MARIADB_PASSWORD}" -e "SELECT 1;"; do
  sleep 1
done

wp config set --allow-root DB_NAME "${MARIADB_DATABASE}"
wp config set --allow-root DB_USER "${MARIADB_USER}"
wp config set --allow-root DB_PASSWORD "${MARIADB_PASSWORD}"
wp config set --allow-root DB_HOST "mariadb:3306"

if ! wp core is-installed --allow-root --url="https://${DOMAIN_NAME}"; then
  wp core install --allow-root \
    --url="https://${DOMAIN_NAME}" \
    --title="My WordPress Site" \
    --admin_user="${WP_ADMIN_USER}" \
    --admin_password="${WP_ADMIN_PASS}" \
    --admin_email="${WP_ADMIN_EMAIL}"

  wp user create --allow-root "${WP_USER}" "${WP_EMAIL}" \
    --user_pass="${WP_PASS}"
fi

echo ">> SERVER IS RUNNING..."

exec /usr/sbin/php-fpm8.2 -F