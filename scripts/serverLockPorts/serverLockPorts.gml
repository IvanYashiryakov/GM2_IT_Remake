/// @description  serverLockPorts(_cX, _cY);
/// @param _cX
/// @param  _cY
function serverLockPorts(argument0, argument1) {
	var _cX = argument0;
	var _cY = argument1;
	var _srv = ds_map_find_value(Field[_cX, _cY], "content");
	var _portsCount = 0;
	var _delSide;
	var _delPlugged;

	if (ds_map_find_value(Field[_cX, _cY-2], "downPlugged"))
	    { _portsCount++; }
	    else
	    { _delSide = UP; _delPlugged = "upPlugged"; }
    
	if (ds_map_find_value(Field[_cX-1, _cY], "rightPlugged"))
	    { _portsCount++; }
	    else
	    { _delSide = LEFT; _delPlugged = "leftPlugged";}
    
	if (ds_map_find_value(Field[_cX+1, _cY], "leftPlugged"))
	    { _portsCount++; }
	    else
	    { _delSide = RIGHT; _delPlugged = "rightPlugged"; }
    
	if (ds_map_find_value(Field[_cX, _cY+1], "upPlugged"))
	    { _portsCount++; }
	    else
	    { _delSide = DOWN; _delPlugged = "downPlugged"; }
    
	if (_portsCount == 3) {
	    _srv.w[_delSide] = false;
	    _srv.portsCount = 3;
	    ds_map_replace(Field[_cX, _cY], _delPlugged, false);
	    ds_map_replace(Field[_cX, _cY-1], _delPlugged, false);
	}



}
