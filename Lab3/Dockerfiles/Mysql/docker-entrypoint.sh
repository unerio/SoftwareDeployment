#!/bin/bash

chown -R mysql:mysql /var/lib/mysql /var/run/mysqld

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mysql/my.cnf
sed -i "s/dbname/$MYSQL_DATABASE/g" /docker-entrypoint-initdb.d/init-database.sql
sed -i "s/dbuser/$MYSQL_USER/g" /docker-entrypoint-initdb.d/init-database.sql
sed -i "s/dbpassword/$MYSQL_PASSWORD/g" /docker-entrypoint-initdb.d/init-database.sql

mysqld --init-file="/docker-entrypoint-initdb.d/init-database.sql"