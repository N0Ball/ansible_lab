.PHONY: all

restart: down up

run: restart
	docker compose exec controller ansible-playbook hello_world.yml
	docker compose down

con:
	docker compose exec -it controller /bin/sh

down:
	@docker compose down

up: 
	@export SSH_PUB_KEY="$(shell cat ~/.ssh/id_rsa.pub)" && docker compose up -d

build:
	@export SSH_PUB_KEY="$(shell cat ~/.ssh/id_rsa.pub)" && docker compose build