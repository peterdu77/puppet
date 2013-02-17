class base {
  include sudo, ssh, ntp, puppet
}
node 'puppet.lab.local' {
  include base
  include puppet::master
}


node 'web.lab.local' {
  include base
  include apache

  apache::vhost { 'www.example.com':
    port => 80,
    docroot => '/var/www/www.example.com',
    ssl => false,
    priority => 10,
    serveraliases => 'home.example.com',
  }
}
node 'db.lab.local' {
  include base
  include mysql
}
node 'mail.lab.local' {
  include base
  include postfix
}