# Define: name
 # Parameters:
 # arguments
 #
 define ssh::authorized_keys ($user) {

    file { '.ssh':
        ensure => directory,
        owner  => $user,
        mode   => '700',
        path   => "/home/${user}/",
    }


    file { 'authorized_keys':
        ensure => present,
        owner  => $user,
        mode   => '640',
        path   => "/home/${user}/.ssh/authorized_keys",
        source => 'puppet:///modules/ssh/id_rsa.pub',
        require => File['.ssh'],
    }
}