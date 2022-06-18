default: up

up:
	docker-compose up -d

composer:
	docker-compose exec -u www-data app composer install

database-create:
	docker-compose exec -u www-data app php bin/console doctrine:database:create

database-update:
	docker-compose exec -u www-data app php bin/console doctrine:migrations:migrate

build:
	docker-compose build

down:
	docker-compose down

stop:
	docker-compose stop

start:
	docker-compose start

bash:
	docker-compose exec app sh

composer-require:
	docker-compose exec -u www-data app composer require $(lib)

cache:
	docker-compose exec -u www-data app php bin/console cache:clear
