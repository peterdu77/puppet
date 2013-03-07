# Define: name
 # Parameters:
 # arguments
 #
 define ssh::authorized_keys ($user=$title, $ensure=present) {

    file { "/home/${user}/.ssh":
        ensure => directory,
        owner  => $user,
        mode   => '700',
        path   => "/home/${user}/.ssh",
    }
    ->
    file { "/home/${user}/.ssh/authorized_keys":
        ensure => $ensure,
        owner  => $user,
        mode   => '640',
        path   => "/home/${user}/.ssh/authorized_keys",
        source => "puppet:///modules/ssh/${user}.id_rsa.pub",
    }
}