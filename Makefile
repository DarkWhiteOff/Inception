COMPOSEFILE = srcs/docker-compose.yml

CC = docker compose
FLAGS = -f

all: up

up:
	@ $(CC) $(FLAGS) $(COMPOSEFILE) up

down:
	@ $(CC) $(FLAGS) $(COMPOSEFILE) down

clean:
	@ $(CC) $(FLAGS) $(COMPOSEFILE) down --volumes --rmi all

fclean: clean
	sudo rm -rf /home/$(USER)/data/mariadb/*
	sudo rm -rf /home/$(USER)/data/wordpress/*

re: fclean all

.PHONY: all up down clean fclean re