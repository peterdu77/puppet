class mysql-server::service {
  service { 'mysql':
    ensure => running,
    #hasstatus => true,
    #hasrestart => true,
    enabled => true,
    require => Class["mysql-server::config"]
  }
}