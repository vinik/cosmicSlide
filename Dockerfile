FROM ubuntu:trusty

MAINTAINER Vinícius Kirst <vinicius@versul.com.br>

RUN apt-get update
RUN apt-get install -y --force-yes apache2 php5 curl php5-curl php5-intl

RUN a2enmod php5
RUN a2enmod rewrite

# Manually set up the apache environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
RUN usermod -u 1000 www-data

EXPOSE 22 80

ADD . /var/www/site

ADD docker/apache-config.conf /etc/apache2/sites-enabled/000-default.conf

RUN touch /var/www/site/logs/error.log
RUN chmod -R 777 /var/www/site/logs/

RUN mkdir /var/www/site/tmp/
RUN touch /var/www/site/tmp/foo
RUN chmod -R 777 /var/www/site/tmp/

CMD /usr/sbin/apache2ctl -D FOREGROUND
