*This project has been created as part of the 42 curriculum by zamgar.*

# Inception

## Description

This project is part of the **Inception** subject from the 42 curriculum.  
The goal is to build a complete and secure web infrastructure using **Docker**
and **Docker Compose**, following best practices.

The goal of the project is to deploy a complete and secure WordPress environment composed of three isolated services:
- **NGINX** as a web server with TLS
- **WordPress** running with **PHP-FPM**
- **MariaDB** as the database

Each service runs in its own Docker container, connected through a dedicated Docker network.

---

## Project Architecture

The project is composed of three main containers:

- **NGINX**
  - Serves HTTPS traffic (TLSv1.3)
  - Forwards PHP requests to WordPress via FastCGI (PHP -> PHP-FPM)

- **WordPress**
  - Runs PHP-FPM
  - Hosts the WordPress application
  - Communicates with MariaDB to store and retrieve data (PHP-FPM -> SQL)
  - Stores persistent data using bind mount volume

- **MariaDB**
  - Provides the database backend
  - Stores persistent data using bind mount volume

All containers are connected via a **custom Docker network** defined in docker-compose.yml.
An `.env` file is used to centralize configuration values and credentials required by the containers at runtime.

---

## Instructions

### Requirements
- Docker
- Docker Compose
- Make

### Setup

1. Clone the repository:
```bash
git clone https://github.com/DarkWhiteOff/Inception.git
cd Inception
```

2. Create the environment file (based on .env.example):
```bash
cp .env.example .env
```

3. Build and start the containers:
```bash
make
```

4. Access the website:
```
https://zamgar.42.fr
```

## Docker Usage Explanation

Docker is used to isolate each service into its own container.
Each container runs a single main process in the foreground (PID 1).

Docker Compose is used to:
- Define and build each service
- Create a dedicated Docker network
- Manage persistent storage through volumes and bind mounts

This approach provides a lightweight, modular, and scalable alternative to traditional virtual machines.

---

## Technical Comparisons

### Virtual Machines vs Docker
- Virtual Machines run full operating systems and has its own kernel
- Docker containers share the host kernel and are lighter and faster

### Secrets vs Environment Variables
- Sensitive data is stored in environment variables (in `.env` file)
- Docker Secrets would be more secure but environment variables are sufficient for this project

### Docker Network vs Host Network
- Containers communicate through a dedicated Docker bridge network
- Host networking is avoided for security and isolation

### Docker Volumes vs Bind Mounts
- Bind mounts store persistent data on the host machine
- Docker volumes are managed by Docker and provide a cleaner and more portable way to persist data

---

## Resources

- [Docker documentation](https://docs.docker.com/)
- 42 Inception subject
- [Docker](https://docker-curriculum.com/)
- [Docker refs](https://docs.docker.com/reference/dockerfile)
- [Nginx configuration](https://nginx.org/en/docs/beginners_guide.html)
- [SSL Certificate](https://stackoverflow.com/questions/10175812/how-can-i-generate-a-self-signed-ssl-certificate-using-openssl/10176685#10176685)
- [Mariadb configuration](https://www.rootusers.com/how-to-install-and-configure-mariadb/#google_vignette)
- [Wordpress configuration](https://make.wordpress.org/cli/handbook/guides/installing/)
- [Wp cli commands](https://developer.wordpress.org/cli/commands/)

---

## AI Usage

AI tools were used to:
- Understand Docker
- Debug configuration and runtime issues
- Improve documentation