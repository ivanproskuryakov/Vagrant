Vagrant environment for PHP
-----------------------------------            
Vagrant box variables
- IP: 10.0.0.100
- Hosts: localhost.vag & magento.vag
          
          
Installation
-----------------------------------
Download sources, cd to directory with "Vagrantfile" and type "vagrant up"
```
$ cd vagrant
$ vagrant up
```  
To make localhost.vag accessible add following to /etc/hosts  
```
10.0.0.100  localhost.vag
10.0.0.100  magento.vag
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