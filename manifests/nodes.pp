class base {
  include sudo, ssh
}
node 'puppet.lab.local' {
  include base
}
node 'web.lab.local' {
  include base
}
node 'db.lab.local' {
  include base
}
node 'mail.lab.local' {
  include base
  include postfix
}