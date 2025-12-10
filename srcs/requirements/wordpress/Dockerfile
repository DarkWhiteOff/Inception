FROM    debian:bookworm

RUN		apt update -y && apt upgrade -y

RUN		apt install wget php mariadb-client php-fpm php-mysql -y

WORKDIR /var/www

RUN		wget https://fr.wordpress.org/wordpress-6.0-fr_FR.tar.gz

RUN		tar -xzf wordpress-6.0-fr_FR.tar.gz && rm wordpress-6.0-fr_FR.tar.gz

RUN		chown -R root:root /var/www/wordpress

COPY	conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

RUN     wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

RUN     chmod +x wp-cli.phar

RUN     mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress

RUN     mv wp-config-sample.php wp-config.php

COPY    tools/wordpress_setup.sh /
RUN     chmod +x /wordpress_setup.sh

CMD [ "/bin/bash", "/wordpress_setup.sh" ]
