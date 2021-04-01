#!/bin/bash

# Bash script to set drop local site created by sitesetup script 
# See https://gist.github.com/jonathanbossenger/2dc5d5a00e20d63bd84844af89b1bbb4


if [[ $EUID -ne 0 ]]; 
then
   echo "This script must be run as root" 
   exit 1
fi

echo "Enter Your Username : "
read HOME_USER

echo 

SSL_CERTS_DIRECTORY=/home/$HOME_USER/ssl-certs
SITES_DIRECTORY=/home/$HOME_USER/Desktop/websites

echo "Enter Your Site Name : "
echo "Example : Enter example for example.test"
read SITE_NAME

SITE_NAME=$SITE_NAME
SITE_CONFIG_PATH=/etc/apache2/sites-available/$SITE_NAME.conf
SSL_SITE_CONFIG_PATH=/etc/apache2/sites-available/$SITE_NAME-ssl.conf

echo "Deleteing websites directory"

rm -rf $SITES_DIRECTORY/"$SITE_NAME"

echo "Disabling virtual hosts..."

a2dissite "$SITE_NAME".conf
a2dissite "$SITE_NAME"-ssl.conf

echo "Deleting virtual hosts..."

sudo rm -rf "$SITE_CONFIG_PATH"
sudo rm -rf "$SSL_SITE_CONFIG_PATH"

echo "Remove hosts record.."

sed -i "/$SITE_NAME.test/d" /etc/hosts

echo 

echo "Enter your MYSQL root user password :"

read DB_PASSWORD

echo "Deleting database.."

mysql -uroot -p$DB_PASSWORD --execute="DROP DATABASE $SITE_NAME;"

echo "Deleting certs.."

rm -rf $SSL_CERTS_DIRECTORY/"$SITE_NAME"*

echo "Restarting Apache..."

service apache2 restart

echo "Done"
