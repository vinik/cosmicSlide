apt-get update

docker version
DOCKERIZED=$?

if [ $DOCKERIZED -eq 127 ]; then
  wget -qO- https://get.docker.com/ | sh
  usermod -aG docker vagrant
fi

docker pull ubuntu:trusty

cd /vagrant/
docker build -t cosmicslideimg .
docker run -p 80:80 -d -P --name cosmicslidecont -v /vagrant:/var/www/site cosmicslideimg
# docker run -p 80:80 -d -P --name cosmicslidecont -v /home/vinicius/desenv/projects/cosmicSlide:/var/www/site cosmicslideimg


# sudo apt-get install -y --force-yes apache2
# sudo apt-get install -y --force-yes php5
# sudo apt-get install -y --force-yes curl
# sudo apt-get install -y --force-yes php5-curl
# sudo apt-get install -y --force-yes php5-intl
#
# # composer
# if ! [ -f /home/vagrant/composer.phar ]; then
#   curl -sS https://getcomposer.org/installer | php
# fi
#
# # link application
# if ! [ -L /var/www/html ]; then
#   rm -rf /var/www/html
#   ln -fs /vagrant /var/www/html
# fi
#
# sudo cp /vagrant/vagrant/apache2.conf /etc/apache2/
#
# sudo a2enmod rewrite
#
# sudo service apache2 restart
#
# cd /vagrant
# php /home/vagrant/composer.phar update
