FROM debian:buster

RUN apt update && apt upgrade -y

RUN rm -f /etc/php/8.4/fpm/pool.d/www.conf
COPY config/php.conf /etc/php/8.4/fpm/pool.d/www.conf

COPY tools/auto_config.sh /auto_config.sh
RUN chmod +x /auto_config.sh

ENTRYPOINT ["sh", "auto_config.sh"]