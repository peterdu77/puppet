define mi9user::manageuser ($user=$title, $ensure=present) { 
	user { $user: 
		ensure     	=> $ensure,
		gid	   		=> $mi9user::groupname,
		groups     	=> $mi9user::groupname,
		shell      	=> '/bin/bash',
		home        => "/home/${title}",
		managehome  => true,
	}
}
 
 