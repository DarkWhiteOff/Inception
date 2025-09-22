FROM debian:13.0

RUN apt update && apt upgrade -y
RUN apt install wget -y
RUN apt install php8.4 -y
RUN apt install php-fpm -y
RUN apt install php-mysql -y
RUN apt install mariadb-client -y

RUN wget https://fr.wordpress.org/wordpress-6.8.2-fr_FR.tar.gz -P /var/www
RUN cd /var/www && tar -xzf wordpress-6.8.2-fr_FR.tar.gz && rm wordpress-6.8.2-fr_FR.tar.gz
RUN	chown -R root:root /var/www/wordpress

RUN rm -f /etc/php/8.4/fpm/pool.d/www.conf
COPY config/php.conf /etc/php/8.4/fpm/pool.d/www.conf

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY tools/auto_config.sh /auto_config.sh
RUN chmod -R +x /auto_config.sh

ENTRYPOINT ["sh", "auto_config.sh"]