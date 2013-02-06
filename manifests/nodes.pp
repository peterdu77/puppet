class base {
  include sudo, ssh, ntp
}
node 'puppet.lab.local' {
  include base
}
node 'web.lab.local' {
  include base
}
node 'db.lab.local' {
  include base
  include mysql
}
node 'mail.lab.local' {
  include base
  include postfix
}