COMPOSEFILE = srcs/docker-compose.yml

CC = docker compose
FLAGS = -f

all: up

up:
	@ $(CC) $(FLAGS) $(COMPOSEFILE) up --build

down:
	@ $(CC) $(FLAGS) $(COMPOSEFILE) down

clean:
	@ $(CC) $(FLAGS) $(COMPOSEFILE) down --volumes --rmi all

fclean: clean
	sudo rm -rf /home/$(USER)/data/mariadb/*
	sudo rm -rf /home/$(USER)/data/wordpress/*

re: fclean all

.PHONY: all up down clean fclean re

# Container solo
# docker build srcs/requirements/mariadb -t mariadb -> build une image depuis le Dockerfile en lui donnant un nom
# docker run -it nginx / docker run -d nginx -> run un container en se basant sur l'image build, -it pour interagir avec, -d pour le run en background
# docker stop [id] -> stop un running container
# docker rm [id] -> remove a container
# docker rmi [id] -> remove an image, rmi all pour remove all images

# Container compose file
# docker compose -f docker-compose.yml up -> compose les container ensemble, -d pour lancer an background (sans logs), --build pour forcer le build des images (force la reconstruction des images)
# docker compose -f down -> stop et remove les containers,  --volumes --rmi all pour remove volumes et images
# Utiliser un container qui est dans un compose file
# docker exec -it [id] /bin/bash -> acceder au container
# docker logs [id] -> see logs

# Utils
# docker ps -> liste les running containers, -a pour tous les containers
# docker image ls -> liste les images
# docker volume ls -> liste les volumes