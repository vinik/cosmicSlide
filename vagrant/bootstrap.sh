sudo apt-get update
sudo apt-get install -y --force-yes apache2
sudo apt-get install -y --force-yes php5
sudo apt-get install -y --force-yes curl

if ! [ -L /var/www/html ]; then
  rm -rf /var/www/html
  ln -fs /vagrant /var/www/html
fi
