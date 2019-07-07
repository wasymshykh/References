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

Best article on blockchain **[theory + nodejs implementation]**

> https://kauri.io/article/92034a0c23ed4cb4a6ca959e0a4b78b9/v3

And ofcourse **libra** is coming

> https://developers.libra.org/

---

### Cool posts

Learning git concepts not commands **[dev.to article]**

> https://dev.to/unseenwizzard/learn-git-concepts-not-commands-4gjc

**Nodejs awesomeness**
[nodejs cheatsheet]

> https://github.com/LeCoupa/awesome-cheatsheets/blob/master/backend/node.js

[nodejs security best practices]

> https://medium.com/@nodepractices/were-under-attack-23-node-js-security-best-practices-e33c146cb87d

**PHP related**
[php cheatsheet]

> https://github.com/LeCoupa/awesome-cheatsheets/blob/master/languages/php.php

**Development Related**
[Emerging Tech Dev Posts]

> https://blog.bitsrc.io/

**Software Development**
[SOLID Explanation]

> https://blog.bitsrc.io/solid-principles-every-developer-should-know-b3bfa96bb688

---
