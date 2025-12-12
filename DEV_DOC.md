# DEVELOPER DOCUMENTATION

## Environment Setup

### Prerequisites
- Docker
- Docker Compose
- GNU Make

### Required Files
- `.env` (create from `.env.example`)
- Dockerfiles (+conf, + scirpts if needed)
- docker-compose.yml
- Makefile

---

## Building and Launching the Project

### Build and start containers
```bash
make
```

### Stop containers
```bash
make down
```

### Remove containers and volumes
```bash
make clean
```

### Remove containers, volumes and local data
```bash
make fclean
```

---

## Useful Docker Commands

### List containers (-a for all, even stopped containers)
```bash
docker ps -a
```

### Enter a single container
```bash
docker exec -it wordpress bash
```

---

## Project Data Persistence

Data is stored using bind mounts:
- WordPress data: `/var/www/wordpress`
- MariaDB data: `/var/lib/mysql`

Volumes are mounted from:
```
/home/<login>/data/
```

Removing containers does not remove data unless volumes are explicitly deleted.

---

## Development Notes

- Each container runs a single foreground process (PID 1)
- Initialization is handled by entrypoint scripts
- Services communicate through Docker network
- No host networking or legacy Docker links are used

---

## Debugging

### Check service connectivity
```bash
docker compose logs
```

### Restart a single service
```bash
docker compose restart wordpress
```

---

## Security Notes

- Secrets are managed via environment variables
- `.env` is excluded is not tracked in Git
- HTTPS is enforced using TLSv1.3