Vagrant environment for PHP
-----------------------------------            
Vagrant box variables
- IP: "10.0.0.100"
- MySQL root password: "vagrant"
- Default host: "localhost.vag"
          
          
Installation
-----------------------------------
Download sources, cd to directory with "Vagrantfile" and type "vagrant up"
```
$ cd vagrant
$ vagrant up
```  
add follwing line to /etc/hosts file to make localhost.vag work on your host 
```
10.0.0.100      localhost.vag
```

Configuration
-----------------------------------
Inside vagrant/puppet build
- PHP 5.4 (dev, cli, pear)
- Apache
- MySQL 5.5.X
- Composer
- PhpUnit

PHP extensions
- curl
- intl
- cli
- gd
- mcrypt
- mysql
- xdebug
- apc