class git::windows {
	require chocolatey
	package { 'git':
    	   	ensure   => installed,
        	provider => chocolatey
	}
}