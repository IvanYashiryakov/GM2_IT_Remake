function correctDir(argument0) {
	// correctDir(wDir);
	var _arg = argument0;

	if (_arg < 0) {
	    _arg += 4;
	} else if (_arg > 3) {
	    _arg -= 4;
	}

	return _arg;



}
