class mysql {
  
$mysqlpkg  = ['mysql-server', 'mysql-client', 'mysql-common']

  package { $mysqlpkg:
	  ensure => present,
	  require => User['mysql'],
  }

  user { 'mysql':
	  ensure => present,
	  comment => 'MySQL user',
	  gid => 'mysql',
	  shell => '/bin/false',
	  require => Group['mysql'],
  }

  group { 'mysql':
	  ensure => present,
  }


  file { '/etc/mysql/my.cnf':
	  ensure => present,
	  source => "puppet:///modules/mysql/my.cnf",
	  owner => "mysql",
	  group => "mysql",
	  require => Package[$mysqlpkg],
  }

  file { '/etc/mysql':
	  group => "mysql",
	  owner => "mysql",
	  recurse => true,
	  require => File['/etc/mysql/my.cnf'],
  }

}