FROM    debian:bookworm

RUN     apt update -y && apt upgrade -y
RUN     apt install wget php mariadb-client php-fpm php-mysql -y

WORKDIR /var/www
RUN		wget -q https://fr.wordpress.org/latest-fr_FR.tar.gz
RUN		tar -xzf latest-fr_FR.tar.gz && rm -f latest-fr_FR.tar.gz

RUN     wget -q https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN     chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/wordpress
RUN     mv wp-config-sample.php wp-config.php

COPY	conf/www.conf /etc/php/8.2/fpm/pool.d/www.conf

COPY    tools/wordpress_setup.sh /usr/local/bin/wordpress_setup.sh
RUN     chmod +x /usr/local/bin/wordpress_setup.sh

RUN     ln -sf /bin/true /usr/sbin/sendmail

CMD     ["/usr/local/bin/wordpress_setup.sh"]