# References

## Snippets

### Linux

Opening directory in file explorer via terminal

```Shell
# Opening current directory
$ gio open .
```

```Shell
# Disable wayland
$ nano /etc/gdm3/custom.conf
```

```Shell
# Opening specific directory
$ gio open /dir/dir
```

```Shell
# Fixing external display resolution
# Remember to disable WayLand first
$ cvt 1280 1024 60
# Get and paste text after "Modeline"
$ xrandr --newmode "1280x1024_60.00"  109.00  1280 1368 1496 1712  1024 1027 1034 1063 -hsync +vsync
# "xrandr -q" to check display name
$ xrandr --addmode VGA-0 1280x1024_60.00
```

---

### Github Branching flow

```Shell
# Listing all branches
$ git branch -a

# Creating a branch
$ git checkout -b [branch name]

# Adding changes to a branch
$ git add [branch name]
```

Switching back to master branch before **merging**

```Shell
# Merging branch
$ git merge [branch name] [flag]
```

use *"**–no-ff**" flag* for keeping all commit messages

```Shell
# Deleting a branch
$ git branch -d [branch name]
```

---

### Nginx

Virtual Hosts

> <https://gist.github.com/soheilhy/8b94347ff8336d971ad0>

Let's encrpt cert

```Shell
# certbot installation
$ apt-get update
$ apt-get install software-properties-common
$ add-apt-repository universe
$ add-apt-repository ppa:certbot/certbot
$ apt-get update
$ apt-get install certbot python3-certbot-nginx

# ssl with nginx
$ certbot --nginx
```

> ref: <https://certbot.eff.org/docs/using.html>

---

### Docker flow

Dockerfile for nodejs
_creating "backend" folder where we can put all the code and this Dockerfile_

```Docker
FROM node:14

RUN mkdir -p /home/[folder name]/backend/node_modules && chown -R node:node /home/[folder name]/backend

WORKDIR /home/[folder name]/backend

COPY package*.json ./

USER node

RUN npm install

COPY --chown=node:node . .

EXPOSE 6000

CMD [ "node", "index.js" ]
```

Shell script for image update
_place shell script file outside the "backend" folder and use './backend' as folder path (as shown in example), i'll improve code later_

```console
docker build -t [image name] [folder path]
docker container stop [container name]
docker container rm [container name]
docker run --name [container name] -p [expose container port]:[internal container port] -d [image name]
```

_example_:

> docker build -t wasym/iamwaseem-nodejs ./backend
>
> docker container stop nodeapp
>
> docker container rm nodeapp
>
> docker run --name nodeapp -p 6000:6000 -d wasym/iamwaseem-nodejs

---

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

Find (_yours might be different_)

```apache
<Directory /home/wasym/Desktop/www>
```

Between the **"Directory"** tags add following line

```apache
AllowOverride All
```

---

## Articles & Misc

### Blockchain

Best article on blockchain **[theory + nodejs implementation]**

> <https://kauri.io/article/92034a0c23ed4cb4a6ca959e0a4b78b9/v3>

And ofcourse **libra** is coming

> <https://developers.libra.org/>

---

### AI/ML/DL

**MIT 6.S191** Introduction to Deep Learning _starting from 2020_

> <http://introtodeeplearning.com/>

---

### Cool posts

Learning git concepts not commands **[dev.to article]**

> <https://dev.to/unseenwizzard/learn-git-concepts-not-commands-4gjc>

#### Awesome awesomeness

[600+ MOOCS]

> <https://qz.com/1437623/600-free-online-courses-you-can-take-from-universities-worldwide/>

[list of difference awesome lists]

> <https://github.com/sindresorhus/awesome#media>

[difference icons for use]

> <https://github.com/notlmn/awesome-icons#readme>

[AI Resources]

> <https://www.marktechpost.com/free-resources/>

#### Nodejs awesomeness

[nodejs cheatsheet]

> <https://github.com/LeCoupa/awesome-cheatsheets/blob/master/backend/node.js>

[nodejs security best practices]

> <https://medium.com/@nodepractices/were-under-attack-23-node-js-security-best-practices-e33c146cb87d>

[Bulletproof node.js project architecture]

> <https://dev.to/santypk4/bulletproof-node-js-project-architecture-4epf?fbclid=IwAR1rmq3LXJACjpl4i8VMmmPABwBQFqjfhgCsyxkrFvyRNstCnuUswHldKh0>

[nodejs all about streams]

> <https://github.com/substack/stream-handbook>

#### PHP related

[php cheatsheet]

> <https://github.com/LeCoupa/awesome-cheatsheets/blob/master/languages/php.php>

> <https://github.com/ziadoz/awesome-php>

[php security best practices]

> <https://thisinterestsme.com/php-best-practises/>

#### Development Related

[Emerging Tech Dev Posts]

> <https://blog.bitsrc.io/>

[10 Github repos new developer should know]

> <https://morioh.com/p/268e1656b417>

#### Software Development

[SOLID Explanation]

> <https://blog.bitsrc.io/solid-principles-every-developer-should-know-b3bfa96bb688>

[Software Construction]

> <https://ocw.mit.edu/courses/electrical-engineering-and-computer-science/6-005-software-construction-spring-2016/readings/>

[SC Java]

> <https://courses.edx.org/courses/course-v1:MITx+6.005.1x+3T2016/course/>

#### Cloud

[Serverless Handbook]

> <https://serverlesshandbook.dev/getting-started>

---

### Cool tricks

**js** drag and drop elements

> <https://alligator.io/js/drag-and-drop-vanilla-js/>

**.edu** email adress

> <https://docs.google.com/document/d/1IjxLeNuF58-lL-aHCAbpliap6qUuTR7UMEPAaYHaBHg/preview>

---

### Softwares

**Raidrive** mounting cloud drives to local system

> <https://www.raidrive.com/>

**balenaEtcher** simple flash - os image to USB

> <https://www.balena.io/etcher/>
