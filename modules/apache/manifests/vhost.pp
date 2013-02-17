define apache::vhost( $port, $docroot, $ssl=true, $template='apache/vhost.conf.erb', $priority, $serveraliases = '' ) {
	include apache
	file {"/etc/apache2/sites-enabled/${priority}-${name}":
		content => template($template),
		owner => 'root',
		group => 'root',
		mode => '777',
		require => Class["apache::install"],
		notify => Class["apache::service"],
	}

	file {"/var/www/${name}":
		ensure => directory,
		owner => root,
		group => root,
		mode => '744',
		subscribe => File["/etc/apache2/sites-enabled/${priority}-${name}"]
	}

}