class mysql-server::config {
  file { "/etc/mysql/my.cnf":
    ensure => present,
    source => "puppet:///modules/mysql-server/my.cnf",
    owner => "mysql",
    group => "mysql",
    require => Class["mysql-server::install"],
    notify => Class["mysql-server::service"]
}
  file { "/etc/mysql":
    group => "mysql",
    owner => "mysql",
    recurse => true,
    require => File["/etc/mysql/my.cnf"],
  }
 
}