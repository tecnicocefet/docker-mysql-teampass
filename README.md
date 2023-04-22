# DEVOPS

Hoje o labs foi criar dois containers um com a aplicação teampass e o outro com o mysql depois linkar os dois containers. Também criamos um volume fora do container. Assim podemos matar os containers preservando os dados do banco .

Comandos usados para criar o container do MYSQL

#Criar o container do MSQL
docker run -d \
--mount type=volume,src=meumysql,dst=/var/lib/mysql \
 -e MYSQL_ROOT_PASSWORD=root \
 --name mysql \
 --hostname mysql \
 mysql:5.6.43

#Acessar o container
docker exec -it mysql bash

#Acessar o Mysql
mysql -uroot -proot

#Criar tablespace e usuário
CREATE DATABASE teampass_db;
CREATE USER 'teampass_user'@'localhost' IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON teampass_db.* TO 'teampass_user'@'%' IDENTIFIED BY '123456';
FLUSH PRIVILEGES;
exit

O cotainer da aplicação teampass foi criado via Dockerfile



