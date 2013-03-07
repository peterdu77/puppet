case $operatingsystem {
	'centos', 'redhat', 'fedora': { $groupname   = 'adm'}
	'ubuntu', 'debian':           { $groupname   = 'adm'}
	default:                     { $groupname   = 'adm'}
}

$userList = [ user1, user2, user3 ]

define createUsers {
	user { $userList:
		ensure     	=> present,
		gid	   		=> $groupname,
		groups     	=> $groupname,
		shell      	=> '/bin/bash',
		#home       => "/home/${user_name}",
		#password   => '$6$59iYrjqU$w53/EzOnl.Obl4IGUBYedU.WX9dYjZLTvT4DpmbN005VSHh2Poe6mDPdvLHaTaGuXWHO9fLmD9arcnCikYoAv/',
		managehome => true,
	}
}
