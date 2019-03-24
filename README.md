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

Enable mod_rewrite on apache 
> sudo a2enmod rewrite
Restart apache
>sudo systemctl restart apache2

Go to
> cd /etc/apache2/
Edit
> sudo gedit apache2.conf
Find <Directory /home/wasym/Desktop/www> *yours might be different* & add
> AllowOverride All

___