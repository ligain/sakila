# Sakila DB
To connect to DB use credentials:

**db:** sakila

**user:** postgres

**password:** sakila

**port:** 5555

The same password for the `root` user.


## How to set up database
1) Install docker & docker-compose
```
$ docker --version
Docker version 17.03.2-ce, build f5ec1e2
$ docker-compose --version
docker-compose version 1.13.0, build 1719ceb
```
2) Clone a repository
```
$ git clone https://github.com/ligain/sakila.git
```
3) Drill down a project directory
```
$ cd sakila/
```

4) Run project
```
$ docker-compose up
```
To to stop a project use `docker-compose down` command.


## Project Goals
The code is written for educational purposes.
