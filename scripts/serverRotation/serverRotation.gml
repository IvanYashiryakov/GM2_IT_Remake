/// @description  serverRotation();
function serverRotation() {
	var nextPort = correctDir(lastPort-1);

	if (portsCount == 2) {
	    while !(w[lastPort] and !w[nextPort]) {
	        lastPort = correctDir(lastPort-1);
	        nextPort = correctDir(lastPort-1);
	    }
	        w[nextPort] = true;
	        w[lastPort] = false;
	        lastPort = nextPort;
	} else if (portsCount == 1) {
	    var wTemp = w[LEFT];
	    w[LEFT] = w[UP];
	    w[UP] = w[RIGHT];
	    w[RIGHT] = w[DOWN];
	    w[DOWN] = wTemp;
	} else {
	    var wTemp = w[LEFT];
	    w[LEFT] = w[DOWN];
	    w[DOWN] = w[RIGHT];
	    w[RIGHT] = w[UP];
	    w[UP] = wTemp;
	}



}
