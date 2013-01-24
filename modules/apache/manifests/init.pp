# init.pp
    
class apache {
  case $operatingsystem {
    centos, redhat: { 
      $package_name = 'httpd'
      $service_name = 'httpd'
      $conf_file    = 'httpd.conf'
      $conf_path    = '/etc/httpd/conf'
      $doc_root     = '/var/www/html'
    }
    debian, ubuntu: { 
      $package_name = 'apache2'
      $service_name = 'apache2'
      $conf_file    = 'apache2.conf'
      $conf_path    = '/etc/apache2'
      $doc_root     = '/var/www'
    }
  }
  
  package { 'apache':
    ensure => installed,
    name   => $package_name,
  }
  
  service { 'apache':
    name      => $service_name,
    ensure    => running,
    enable    => true,
    subscribe => File['apache2.conf'],
  }
  
  file { 'apache2.conf':
    path    => "${conf_path}/${conf_file}",
    ensure  => file,
    require => Package['apache'],
    source  => "puppet:///modules/apache/${conf_file}",
  }

  file { 'img_404.jpg':
    path    => "${doc_root}/img_404.jpg",
    ensure  => file,
    require => Package['apache'],
    mode    => '777',
    source  => "puppet:///modules/apache/img_404.jpg",
  }

  file { '404.html':
    path    => "${doc_root}/404.html",
    ensure  => file,
    require => Package['apache'],
    mode    => '777',
    source  => "puppet:///modules/apache/404.html",
  }

  file { 'index.html':
    path    => "${doc_root}/index.html",
    ensure  => file,
    require => Package['apache'],
    mode    => '777',
    source  => "puppet:///modules/apache/index.html",
  }
}
    
    # (Remember not to declare the class yet.)