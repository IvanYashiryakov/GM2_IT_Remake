function checkLimitForOneMoreConnection(argument0, argument1) {
	// checkLimitForOneMoreConnection(cX, cY);

	var _cX = argument0;
	var _cY = argument1;
	var _connectionsCount = 0;

	if (ds_map_find_value(Field[_cX, _cY], "leftPlugged"))
	    _connectionsCount++;
	if (ds_map_find_value(Field[_cX, _cY], "upPlugged"))
	    _connectionsCount++;
	if (ds_map_find_value(Field[_cX, _cY], "rightPlugged"))
	    _connectionsCount++;
	if (ds_map_find_value(Field[_cX, _cY], "downPlugged"))
	    _connectionsCount++;

	if (_connectionsCount >= 3) {
	    //ds_map_replace(Field[_cX, _cY], "connectionLimit", true);
	    return false;
	}

	//ds_map_replace(Field[_cX, _cY], "connectionLimit", false);
	return true;



}
