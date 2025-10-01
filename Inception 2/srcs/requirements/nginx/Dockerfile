FROM debian:buster

RUN apt update && apt upgrade -y

RUN rm -f /etc/nginx/nginx.conf
COPY config/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]