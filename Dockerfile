FROM ubuntu:trusty

MAINTAINER Vinícius Kirst <vinicius@versul.com.br>

RUN apt-get update
RUN apt-get install -y --force-yes apache2 php5 curl php5-curl php5-intl php5-mcrypt

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

# RUN chmod -R 777 /var/www/site/app/tmp/

# composer
RUN curl -sS https://getcomposer.org/installer | php
WORKDIR /var/www/site/
RUN /composer.phar install

CMD /usr/sbin/apache2ctl -D FOREGROUND
