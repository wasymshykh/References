# References

### Linux

Opening directory in file explorer via terminal

```Shell
# Opening current directory
$ gio open .
```

```Shell
# Opening specific directory
$ gio open /dir/dir
```

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

Find **<Directory /home/wasym/Desktop/www>** _yours might be different_. Between the **"Directory"** tags add following line

```apache
AllowOverride All
```

---

### Blockchain

_Best article on blockchain [theory + nodejs implementation]_
https://kauri.io/article/92034a0c23ed4cb4a6ca959e0a4b78b9/v3

_And ofcourse libra is coming_
https://developers.libra.org/

---
