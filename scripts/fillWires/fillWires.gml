function fillWires(argument0, argument1) {
	// fillWires(obj_Server, true);
	if (argument1) {
	    with (argument0) {
	        ds_map_replace(Field[cX, cY], "signal", true);
	        var _wToCheckX = ds_list_create();
	        var _wToCheckY = ds_list_create();
	        var _wToCheckD = ds_list_create();  // direction
	        var _listLen = 0;
	        if (w[3]) {
	            ds_list_add(_wToCheckX, cX);
	            ds_list_add(_wToCheckY, cY+1);
	            ds_list_add(_wToCheckD, UP);
	        }
	        if (w[1]) {
	            ds_list_add(_wToCheckX, cX);
	            ds_list_add(_wToCheckY, cY-2);
	            ds_list_add(_wToCheckD, DOWN);
	        }
	        if (w[2]) {
	            ds_list_add(_wToCheckX, cX+1);
	            ds_list_add(_wToCheckY, cY);
	            ds_list_add(_wToCheckD, LEFT);
	        }
	        if (w[0]) {
	            ds_list_add(_wToCheckX, cX-1);
	            ds_list_add(_wToCheckY, cY);
	            ds_list_add(_wToCheckD, RIGHT);
	        }
	        while (true) {
	            _listLen = ds_list_size(_wToCheckX);
	            if (_listLen == 0) break;
	            for (var i = 0; i < _listLen; i++) {
	                var _cX = ds_list_find_value(_wToCheckX, i);
	                var _cY = ds_list_find_value(_wToCheckY, i);
	                var _dir = ds_list_find_value(_wToCheckD, i);
	                if (cellValid(_cX, _cY)) {
	                    if (!ds_map_find_value(Field[_cX, _cY], "signal")) {
	                        if (ds_map_find_value(Field[_cX, _cY], "contentType") == item.Wire or ds_map_find_value(Field[_cX, _cY], "contentType") == item.PC) {
	                            if (ds_map_find_value(Field[_cX, _cY], "content").w[_dir]) {
	                                ds_map_replace(Field[_cX, _cY], "signal", true);
	                                if (ds_map_find_value(Field[_cX, _cY], "content").w[DOWN] and cellValid(_cX, _cY+1)) {
	                                    ds_list_add(_wToCheckX, _cX);
	                                    ds_list_add(_wToCheckY, _cY+1);
	                                    ds_list_add(_wToCheckD, UP);
	                                }
	                                if (ds_map_find_value(Field[_cX, _cY], "content").w[UP] and cellValid(_cX, _cY-1)) {
	                                    ds_list_add(_wToCheckX, _cX);
	                                    ds_list_add(_wToCheckY, _cY-1);
	                                    ds_list_add(_wToCheckD, DOWN);
	                                }
	                                if (ds_map_find_value(Field[_cX, _cY], "content").w[RIGHT] and cellValid(_cX+1, _cY)) {
	                                    ds_list_add(_wToCheckX, _cX+1);
	                                    ds_list_add(_wToCheckY, _cY);
	                                    ds_list_add(_wToCheckD, LEFT);
	                                }
	                                if (ds_map_find_value(Field[_cX, _cY], "content").w[LEFT] and cellValid(_cX-1, _cY)) {
	                                    ds_list_add(_wToCheckX, _cX-1);
	                                    ds_list_add(_wToCheckY, _cY);
	                                    ds_list_add(_wToCheckD, RIGHT);
	                                }
	                            }
	                        }
	                    }
	                }
	            }
	            for (var i = 0; i < _listLen; i++) {
	                ds_list_delete(_wToCheckX, 0);
	                ds_list_delete(_wToCheckY, 0);
	                ds_list_delete(_wToCheckD, 0);
	            }
	        }
	        ds_list_destroy(_wToCheckX);
	        ds_list_destroy(_wToCheckY);
	        ds_list_destroy(_wToCheckD);
	    }
	}
	WiresConnected = 0;
	with(obj_Wire) {
	    if (ds_map_find_value(Field[cX, cY], "signal") == true) {
	        image_index = 1;
	        WiresConnected++;
	    } else {
	        image_index = 0;
	    }
	}
	PCConnected = 0;
	with(obj_PCWire) {
	    if (ds_map_find_value(Field[cX, cY], "signal") == true) {
	        image_index = 1;
	        selfPC.isON = true;
	        PCConnected++;
	    } else {
	        image_index = 0;
	        selfPC.isON = false;
	    }
	}



}
