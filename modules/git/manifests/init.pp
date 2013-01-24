class git {
	case $::kernel {
    	/(?i)linux/: { include "git::linux" }
    	/(?i)windows/: { include "git::windows" } 
	}
}