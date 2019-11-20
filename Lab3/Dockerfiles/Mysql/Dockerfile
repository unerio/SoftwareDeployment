FROM debian:jessie

COPY docker-entrypoint.sh docker-entrypoint.sh
COPY init-database.sql /docker-entrypoint-initdb.d/
RUN export DEBIAN_FRONTEND="noninteractive"
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password password root'"]
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-server-5.5 mysql-server/root_password_again password root'"]
RUN apt-get update
RUN apt-get install -y mysql-server

ENTRYPOINT ./docker-entrypoint.sh

EXPOSE 3306