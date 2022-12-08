function createServer(argument0, argument1) {
	// createServer(cX, cY);

	var _server;
	var _cX = argument0;
	var _cY = argument1;

	_server = instance_create(_cX*100 + 70, _cY*100 + 100, obj_Server);
	_server.cX = _cX;
	_server.cY = _cY;
	if (_server.w[UP]) {
	    ds_map_replace(Field[_cX, _cY-1], "upPlugged", true);
	    ds_map_replace(Field[_cX, _cY], "upPlugged", true);
	}
	if (_server.w[DOWN])    ds_map_replace(Field[_cX, _cY], "downPlugged", true);
	if (_server.w[LEFT])    ds_map_replace(Field[_cX, _cY], "leftPlugged", true);
	if (_server.w[RIGHT])   ds_map_replace(Field[_cX, _cY], "rightPlugged", true);
    
	ds_map_replace(Field[_cX, _cY], "signal", true);
	ds_map_replace(Field[_cX, _cY], "content", _server);
	ds_map_replace(Field[_cX, _cY], "contentType", item.Server);

	ds_map_replace(Field[_cX, _cY-1], "signal", true);
	ds_map_replace(Field[_cX, _cY-1], "content", _server);
	ds_map_replace(Field[_cX, _cY-1], "contentType", item.Server);

	return _server;



}
