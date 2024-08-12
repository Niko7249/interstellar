# default make file
#DA CAMBIARRE I PATH DEI VOLUMI PER RISPETTARE SUBJECT
WP_DATA = ~/interstellar/wordpress #define the path to the wordpress data
DB_DATA = ~/interstellar/mariadb #define the path to the mariadb data

# default target
all: up

# start the biulding process
# create the wordpress and mariadb data directories.
# start the containers in the background and leaves them running
up:
	docker compose -f ./src/docker-compose.yaml build
	@mkdir -p $(WP_DATA)
	@mkdir -p $(DB_DATA)
	docker compose -f ./src/docker-compose.yaml up -d

# stop the containers
down:
	docker compose -f ./src/docker-compose.yaml down

exec_wp:
	docker exec -it wordpress bash

exec_db:
	docker exec -it mariadb bash

exec_nginx:
	docker exec -it nginx bash

vol_wp:
	docker volume inspect wordpress

vol_db:
	docker volume inspect mariadb

status:
	docker ps

status_all:
	docker compose -f ./src/docker-compose.yaml ps

# clean the containers
# stop all running containers and remove them.
# remove all images, volumes and networks.
# remove the wordpress and mariadb data directories.
# the (|| true) is used to ignore the error if there are no containers running to prevent the make command from stopping.
clean:
	@docker stop $$(docker ps -qa) || true
	@docker rm $$(docker ps -qa) || true
	@docker rmi -f $$(docker images -qa) || true
	@docker volume rm $$(docker volume ls -q) || true
	@docker network rm $$(docker network ls -q) || true
	@sudo rm -rf $(WP_DATA) || true
	@sudo rm -rf $(DB_DATA) || true

# clean and start the containers
re: clean up

# prune the containers: execute the clean target and remove all containers, images, volumes and networks from the system.
prune: clean
	@docker system prune -a --volumes -f
