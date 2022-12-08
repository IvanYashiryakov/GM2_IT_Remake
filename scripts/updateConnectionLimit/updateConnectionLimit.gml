function updateConnectionLimit(argument0, argument1) {
	// updateConnectionLimit(cX, cY);

	var _cX = argument0;
	var _cY = argument1;
	var _connectionsCount = 0;

	if (cellTypeEquals(_cX, _cY, item.Server))
	    return true;
    
	if (ds_map_find_value(Field[_cX, _cY], "leftPlugged"))
	    _connectionsCount++;
	if (ds_map_find_value(Field[_cX, _cY], "upPlugged"))
	    _connectionsCount++;
	if (ds_map_find_value(Field[_cX, _cY], "rightPlugged"))
	    _connectionsCount++;
	if (ds_map_find_value(Field[_cX, _cY], "downPlugged"))
	    _connectionsCount++;

	switch (_connectionsCount) {
	    case 1: ds_map_replace(Field[_cX, _cY], "connectionLimit", false); return true; break;
	    case 2: ds_map_replace(Field[_cX, _cY], "connectionLimit", false); return true; break;
	    case 3: ds_map_replace(Field[_cX, _cY], "connectionLimit", true); return false; break;
	    case 4: ds_map_replace(Field[_cX, _cY], "connectionLimit", true); return false; break;
	    default: return true;
	}



}
