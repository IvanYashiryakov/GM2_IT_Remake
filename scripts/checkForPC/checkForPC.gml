function checkForPC(argument0, argument1, argument2) {
	// checkForPC(cX, cY, server, secondSearch);
	// secondSearch - true если второй поиск
	var _cX = argument0;
	var _cY = argument1;
	var _server = argument2;

	if (ds_map_find_value(Field[_cX, _cY], "contentType") == item.PC) {
	    var _pc = ds_map_find_value(Field[_cX, _cY], "content");
	    if (instance_exists(_pc)) {
	        //if (!_pc.isON) {
	            _pc.isON = true;
	            ds_map_replace(Field[_cX, _cY], "signal", true);
	        //}
	        return true;
	    }
	}
	return false;




}
