# References

### Code Igniter

Setup htaccess file
```apache
RewriteEngine On
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule ^(.*)$ index.php/$1 [L] 
```

Enabling mod_rewrite in apache (linux)


```Shell
# Enable mod_rewrite on apache 
$ sudo a2enmod rewrite

# Restart apache
$ sudo systemctl restart apache2

# Go to
$ cd /etc/apache2/

# Edit apache config file
$ sudo gedit apache2.conf
```

Find **<Directory /home/wasym/Desktop/www>** *yours might be different*. Between the **"Directory"** tags add following line
```apache
AllowOverride All
```
___
