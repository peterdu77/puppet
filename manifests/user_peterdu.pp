case $operatingsystem {
'centos', 'redhat', 'fedora': { $groupname   = 'adm'}
'ubuntu', 'debian':           { $groupname   = 'adm'}
 default:                     { $groupname   = 'adm'}
}

user { "peterdu":
	ensure     => present,
	gid	   => $groupname,
	groups     => $groupname,
	shell      => '/bin/bash',
	home       => '/home/peterdu',
	password   => '$6$59iYrjqU$w53/EzOnl.Obl4IGUBYedU.WX9dYjZLTvT4DpmbN005VSHh2Poe6mDPdvLHaTaGuXWHO9fLmD9arcnCikYoAv/',
	managehome => true,
}

