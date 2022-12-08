function createSrvWires(argument0, argument1) {
	// createSrvWires(obj_Server, portsCount);

	var _srv = argument0;
	var _portsCount = argument1;
	_srv.w[LEFT] = false;
	_srv.w[UP] = false;
	_srv.w[RIGHT] = false;
	_srv.w[DOWN] = false;

	// test begin
	//_srv.portsCount = 4;
	//_srv.w[RIGHT] = true;
	//_srv.w[LEFT] = true;
	//_srv.w[DOWN] = true;
	//_srv.w[UP] = true;
	// test end

	randomize();
	if (_portsCount <= 0) {
	    _srv.portsCount = 1 + irandom(2);
	} else if (_portsCount <= 3) {
	    _srv.portsCount = _portsCount;
	} else {
	    _srv.portsCount = 3;
	}
	var _wDir = irandom(3);
	_srv.w[_wDir] = true;
	_srv.lastPort = _wDir;

	if (_srv.portsCount == 2) {
	    if (irandom(1) == 0) {
	        _wDir = correctDir(_wDir+1);
	    } else {
	        _wDir = correctDir(_wDir-1);
	        _srv.lastPort = _wDir;
	    }
	    _srv.w[_wDir] = true;
	} else if (_srv.portsCount > 2) {
	    for (var i = 0; i < _srv.portsCount - 1; i++) {
	        _wDir = correctDir(_wDir+1);
	        _srv.w[_wDir] = true;
	    }
	}




}
