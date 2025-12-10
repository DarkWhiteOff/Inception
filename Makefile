all: up

up:
	@ docker compose -f srcs/docker-compose.yml up

down:
	@ docker compose -f srcs/docker-compose.yml down

rm:
	@ docker compose -f srcs/docker-compose.yml down --volumes --rmi all