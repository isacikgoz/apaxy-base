#!/bin/bash

# add script function
source /root/script_base.sh

# add packages
PACKAGES_DEFAULT="apache2"

# update
update

# Udapte ubuntu
install_packages

a2enmod rewrite
service apache2 stop

# Upgrade ubuntu
 upgrade

 # Clean ubuntu
 clean_ubuntu

# Create /app repertory and delete  /var/www/html
mkdir -p /app/web && rm -fr /var/www/html
chown www-data:www-data /app/web
echo " <----- Install good ! -----> "