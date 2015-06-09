sudo apt-get update
sudo apt-get install -y --force-yes apache2
sudo apt-get install -y --force-yes php5
sudo apt-get install -y --force-yes curl
sudo apt-get install -y --force-yes php5-curl
sudo apt-get install -y --force-yes php5-intl

# composer
if ! [ -f /home/vagrant/composer.phar ]; then
  curl -sS https://getcomposer.org/installer | php
fi

# link application
if ! [ -L /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs /vagrant /var/www/html
fi

sudo cp /vagrant/vagrant/apache2.conf /etc/apache2/

sudo a2enmod rewrite

sudo service apache2 restart

php /home/vagrant/composer.phar update
