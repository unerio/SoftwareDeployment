FROM debian:jessie

RUN apt-get update
RUN apt-get install wordpress -y
RUN mv /var/www/html/index.html /var/www/html/index.bak
COPY config-localhost.php /etc/wordpress/config-localhost.php
RUN cp -R /usr/share/wordpress/* /var/www/html

ENTRYPOINT ["/usr/sbin/apachectl"]
CMD ["-D", "FOREGROUND"]

EXPOSE 80