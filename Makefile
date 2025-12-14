COMPOSEFILE = srcs/docker-compose.yml

CC = docker compose
FLAGS = -f

DOMAIN_NAME := $(shell sed -n 's/^DOMAIN_NAME=//p' srcs/.env | tr -d '\r')

all: up

data :
	sudo mkdir -p /home/$(USER)/data/mariadb
	sudo mkdir -p /home/$(USER)/data/wordpress
	sudo chown -R $(USER) /home/$(USER)/data

hosts: ; @grep -q "\b$(DOMAIN_NAME)\b" /etc/hosts || echo "127.0.0.1 $(DOMAIN_NAME)" | sudo tee -a /etc/hosts >/dev/null

unhosts: ; @sudo sed -i.bak "/\b$(DOMAIN_NAME)\b/d" /etc/hosts

up:
	@ $(CC) $(FLAGS) $(COMPOSEFILE) up --build

down:
	@ $(CC) $(FLAGS) $(COMPOSEFILE) down

clean:
	@ $(CC) $(FLAGS) $(COMPOSEFILE) down --volumes --rmi all

fclean: clean
	sudo rm -rf /home/$(USER)/data/mariadb
	sudo rm -rf /home/$(USER)/data/wordpress
	sudo mkdir -p /home/$(USER)/data/mariadb
	sudo mkdir -p /home/$(USER)/data/wordpress
	sudo chown -R $(USER) /home/$(USER)/data

re: fclean all

.PHONY: all data hosts unhosts up down clean fclean re