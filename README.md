# graphql-symfony-skeleton

Getting started
===============
Part of this project is copied from 
    https://github.com/duck-invaders/graphql-symfony

This is a complete stack for running Symfony 5 (LTS Version) into Docker containers using docker-compose tool.

I'll try to add some others fixtures :
 - Integrate phpmyadmin interface
 - Create graphql samples
 - Compiler pass use (Example : share content via linkedin, twitter, facebook, ...)
 - Makefile
 - TestUnit (To do)

Prerequisites
-------------

This bundle requires Symfony 5 and the openssl extension.

Installation
------------
    
1. First, clone this repository:
```bash
$ git clone https://github.com/tigersf2/graphql-symfony-skeleton.git
```

2. Start Containers and install dependencies

    
Next, put your Symfony application into symfony folder and do not forget to add symfony.localhost in your /etc/hosts 
file.

Make sure you adjust database_host in parameters.yml to the database container alias "mariadb"

Then, run:

```bash
$ make up
$ make start
$ make composer
$ make database-create
$ make database-update
```
    
3. Configure database into .env file
```bash
DATABASE_URL=mysql://symfony:symfony@mariadb:3306/symfony
```

Note : you can rebuild all Docker images by running:

```bash
$ make build
```  

Access
------
You are done, you can visit your Symfony application

1. Symfony application

```bash
http://symfony.localhost
```
3. Graphiql
```bash
http://symfony.localhost/graphiql
```
2. Kibana

```bash
http://symfony.localhost:81
```
3. phpmyadmin

```bash
http://symfony.localhost:9191
```
symfony / symfony
