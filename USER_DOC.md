# USER DOCUMENTATION

## Overview

This project deploys a complete WordPress environment using Docker.
It provides the following services:

- **NGINX**: HTTPS web server (TLS)
- **WordPress (PHP-FPM)**: Web application
- **MariaDB**: Database backend

All services are isolated in containers and connected through a private Docker network.

---

## Starting and Stopping the Project

### Start the stack
```bash
make
```
or
```bash
docker compose -f srcs/docker-compose.yml up --build
```

### Stop the stack

#### Stop
```bash
make down
```
or
```bash
docker compose -f srcs/docker-compose.yml down
```

#### Stop clean
```bash
make clean
```
or
```bash
docker compose -f srcs/docker-compose.yml down --volumes --rmi all
```

#### Stop fclean
```bash
make fclean
```
or
```bash
docker compose -f srcs/docker-compose.yml down
sudo rm -rf /home/$(USER)/data/mariadb/*
sudo rm -rf /home/$(USER)/data/wordpress/*
```

---

## Accessing the Website

- Website: https://<login>.42.fr
- Example: https://zamgar.42.fr

The website is served over HTTPS using a self-signed certificate.

---

## Accessing the WordPress Admin Panel

- URL: https://<login>.42.fr/wp-admin
- Admin credentials are defined in the `.env` file.

---

## Credentials Management

Credentials are stored as environment variables:
- Domain name
- Database credentials
- WordPress admin and user credentials

They are defined in:
- `.env` (not tracked in Git)
- `.env.example` (template)

Never commit real credentials.

---

## Checking Services Status

### List running containers
```bash
docker ps
```

### Respectively list imgages and volumes
```bash
docker image ls
docker volume ls
```

### View logs
```bash
docker compose logs
```

### Check individual service logs
```bash
docker logs wordpress
docker logs mariadb
docker logs nginx
```

---

## Data Persistence

All data is persisted using bind mounts on the host machine.
Stopping or restarting containers does not delete data.
