class ssh {

    package { 'openssh-server':
        ensure => installed,
        #ensure => absent,
    }

    file { '/etc/ssh/sshd_config':
        source  => 'puppet:///modules/ssh/sshd_config',
        owner   => 'root',
        group   => 'root',
        mode    => '640',
        notify  => Service['ssh'],
        require => Package['openssh-server'],
    }

     service { 'ssh':
        ensure => running,
        enable => true,
        hasstatus => true,
        hasrestart => true,
    }

}
