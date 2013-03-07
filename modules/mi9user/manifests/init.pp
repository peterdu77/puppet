class mi9user {

	case $operatingsystem {
		'centos', 'redhat', 'fedora': { $groupname   = 'adm'}
		'ubuntu', 'debian':           { $groupname   = 'adm'}
		default:                      { $groupname   = 'adm'}
	}

	mi9user::manageuser { 
		"peterdu": ensure => present;
		"craiggunson": ensure => present;
		"sebcole": ensure => present;
		"johnwu": ensure => present;
	}
	ssh::authorized_keys {
		"peterdu": ensure => present;
		"craiggunson": ensure => present;
		"sebcole": ensure => present;
		"johnwu": ensure => present;
	}
}
