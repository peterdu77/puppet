case $operatingsystem {
'centos', 'redhat', 'fedora': { $groupname   = 'admin'}
'ubuntu', 'debian':           { $groupname   = 'adm'}
 default:                     { $groupname   = 'admin'}
}

user { "peterdu":
	ensure     => present,
	gid        => $groupname,
	shell      => '/bin/bash',
	home       => '/home/peterdu',
	managehome => true,
}