#!/bin/bash

# Bash script to set up local site using LAMP on Ubuntu
# Requires Apache2, MySQL, mkcert (https://github.com/FiloSottile/mkcert)
# See also sitedrop.sh https://gist.github.com/jonattanbossenger/4950e107b0004a8ee82aae8b123cce58
# This version improved by @haydar on github


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

SITE_CONFIG_PATH=/etc/apache2/sites-available/$SITE_NAME.conf
SSL_SITE_CONFIG_PATH=/etc/apache2/sites-available/$SITE_NAME-ssl.conf

echo "Creating websites directory"

mkdir -p $SITES_DIRECTORY/"$SITE_NAME"
chown -R $HOME_USER:$HOME_USER $SITES_DIRECTORY/"$SITE_NAME"

echo "Setting up virtual hosts..."

VIRTUAL_HOST="<VirtualHost *:80>
        ServerName $SITE_NAME.test
        ServerAdmin webmaster@$SITE_NAME.test
        DocumentRoot $SITES_DIRECTORY/$SITE_NAME
        <Directory \"$SITES_DIRECTORY/$SITE_NAME\">
            #Require local
            Order allow,deny
            Allow from all
            AllowOverride all
            # New directive needed in Apache 2.4.3:
            Require all granted
        </Directory>
        ErrorLog \${APACHE_LOG_DIR}/$SITE_NAME-error.log
        CustomLog \${APACHE_LOG_DIR}/$SITE_NAME-access.log combined
</VirtualHost>"

echo "$VIRTUAL_HOST" | sudo tee -a "$SITE_CONFIG_PATH"

SSL_VIRTUAL_HOST="<IfModule mod_ssl.c>
    <VirtualHost _default_:443>
        ServerName $SITE_NAME.test
        ServerAdmin webmaster@$SITE_NAME.test
        DocumentRoot $SITES_DIRECTORY/$SITE_NAME
        <Directory \"$SITES_DIRECTORY/$SITE_NAME\">
            #Require local
            Order allow,deny
            Allow from all
            AllowOverride all
            # New directive needed in Apache 2.4.3:
            Require all granted
        </Directory>
        ErrorLog \${APACHE_LOG_DIR}/$SITE_NAME-error.log
        CustomLog \${APACHE_LOG_DIR}/$SITE_NAME-access.log combined
        SSLEngine on
        SSLCertificateFile  $SSL_CERTS_DIRECTORY/$SITE_NAME.test.pem
        SSLCertificateKeyFile $SSL_CERTS_DIRECTORY/$SITE_NAME.test-key.pem
        <FilesMatch \"\.(cgi|shtml|phtml|php)\$\">
                SSLOptions +StdEnvVars
        </FilesMatch>
        <Directory /usr/lib/cgi-bin>
                SSLOptions +StdEnvVars
        </Directory>
    </VirtualHost>
</IfModule>"

echo "$SSL_VIRTUAL_HOST" | sudo tee -a "$SSL_SITE_CONFIG_PATH"

echo "Enabling virtual hosts..."

a2ensite "$SITE_NAME".conf
a2ensite "$SITE_NAME"-ssl.conf

echo "Add hosts record..."

echo "127.0.0.1    $SITE_NAME.test" >> /etc/hosts

echo 

echo "Enter your MYSQL root user password :"

read DB_PASSWORD

echo "Creating database..."

mysql -uroot -p$DB_PASSWORD --execute="CREATE DATABASE $SITE_NAME;"

echo "Add certs..."

mkdir -p $SSL_CERTS_DIRECTORY
chown -R $HOME_USER:$HOME_USER $SSL_CERTS_DIRECTORY
runuser -l $HOME_USER -c "cd $SSL_CERTS_DIRECTORY && mkcert $SITE_NAME.test"

echo "Enabling Apache SSL..."

sudo a2enmod ssl

echo "Restarting Apache..."

service apache2 restart

echo "Done."
