$db_name = "localhost"
$root_password = "vagrant"

group { 'puppet': ensure => present }
Exec { path => [ '/bin/', '/sbin/', '/usr/bin/', '/usr/sbin/' ] }
File { owner => 0, group => 0, mode => 0644 }


#APT ------------------------------------------------------------ 
class {'apt':
  always_apt_update => true,
}

Class['::apt::update'] -> Package <|
    title != 'python-software-properties'
and title != 'software-properties-common'
|>

apt::key { '4F4EA0AAE5267A6C': }

apt::ppa { 'ppa:ondrej/php5-oldstable':
  require => Apt::Key['4F4EA0AAE5267A6C']
}

package { [
    'build-essential',
    'vim',
    'curl',
    'git-core',
    'mc'
  ]:
  ensure  => 'installed',
}

#APACHE --------------------------------------------------------- 
class { 'apache': }

apache::dotconf { 'custom':
  content => 'EnableSendfile Off',
}

apache::module { 'rewrite': }

#PHP ------------------------------------------------------------ 
class { 'php':
  service             => 'apache',
  service_autorestart => false,
  module_prefix       => '',
}

php::module { 'php5-mysql': }
php::module { 'php5-cli': }
php::module { 'php5-curl': }
php::module { 'php5-intl': }
php::module { 'php5-mcrypt': }
php::module { 'php5-xdebug': }
php::module { 'php5-gd': }
php::module { 'php-apc': }

class { 'php::devel':
  require => Class['php'],
}

class { 'php::pear':
  require => Class['php'],
}

php::pear::module { 'PHPUnit':
  repository  => 'pear.phpunit.de',
  use_package => 'no',
  require => Class['php::pear']
}

class { 'composer':
  command_name => 'composer',
  target_dir   => '/usr/local/bin',
  auto_update => true,
  require => Package['php5', 'curl'],
}


php::ini { 'php_ini_configuration':
  value   => [
    'date.timezone = "UTC"',
    'display_errors = On',
    'log_errors = On',         
    'error_reporting = -1',
    'short_open_tag = 0',
    'asp_tags = 0',
    'expose_php = 0',
    'memory_limit = 256M',
    'post_max_size = 20M',     
    'upload_max_filesize = 20M',                      
  ],
  notify  => Service['apache'],
  require => Class['php']
}


#MYSQL ---------------------------------------------------------- 
class { 'mysql::server':
  override_options => { 'root_password' => '{root_password}', },
}

database{ "${db_name}":
  ensure  => present,
  charset => 'utf8',
  require => Class['mysql::server'],
}