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

**Awesome awesomeness**

[600+ MOOCS]

> https://qz.com/1437623/600-free-online-courses-you-can-take-from-universities-worldwide/

[list of difference awesome lists]

> https://github.com/sindresorhus/awesome#media

[difference icons for use]

> https://github.com/notlmn/awesome-icons#readme

**Nodejs awesomeness**

[nodejs cheatsheet]

> https://github.com/LeCoupa/awesome-cheatsheets/blob/master/backend/node.js

[nodejs security best practices]

> https://medium.com/@nodepractices/were-under-attack-23-node-js-security-best-practices-e33c146cb87d

[Bulletproof node.js project architecture]

> https://dev.to/santypk4/bulletproof-node-js-project-architecture-4epf?fbclid=IwAR1rmq3LXJACjpl4i8VMmmPABwBQFqjfhgCsyxkrFvyRNstCnuUswHldKh0

[nodejs all about streams]

> https://github.com/substack/stream-handbook

**PHP related**

[php cheatsheet]

> https://github.com/LeCoupa/awesome-cheatsheets/blob/master/languages/php.php

> https://github.com/ziadoz/awesome-php

[php security best practices]

> https://thisinterestsme.com/php-best-practises/

**Development Related**

[Emerging Tech Dev Posts]

> https://blog.bitsrc.io/

**Software Development**

[SOLID Explanation]

> https://blog.bitsrc.io/solid-principles-every-developer-should-know-b3bfa96bb688

[Software Construction]

> https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-005-software-construction-spring-2016/readings/

[SC Java]

> https://courses.edx.org/courses/course-v1:MITx+6.005.1x+3T2016/course/

**Cloud**

[Serverless Handbook]

> https://serverlesshandbook.dev/getting-started

---

### Cool tricks

**js** drag and drop elements

> https://alligator.io/js/drag-and-drop-vanilla-js/

**.edu** email adress

> https://docs.google.com/document/d/1IjxLeNuF58-lL-aHCAbpliap6qUuTR7UMEPAaYHaBHg/preview

---
