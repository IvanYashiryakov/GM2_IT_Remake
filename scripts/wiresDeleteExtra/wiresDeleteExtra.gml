function wiresDeleteExtra() {
	// wiresDeleteExtra();

	with (obj_Wire) {
	    var isExtra = true;
	    for (var i = 0; i < 4; i++) {
	        var wTemp = w[LEFT];
	        w[LEFT] = w[DOWN];
	        w[DOWN] = w[RIGHT];
	        w[RIGHT] = w[UP];
	        w[UP] = wTemp;
	        image_angle -= 90;
	        fillWiresBySignal(true);
	        var pc_arr;
	        if (instance_exists(obj_Game)) {
	            pc_arr = obj_Game.pc_array;
	        } else if (instance_exists(obj_Game_02)) {
	            pc_arr = obj_Game_02.pc_array;
	        }
	        var pc_count = array_length_1d(pc_arr);
	        for (var p = 0; p < pc_count; p++) {
	            var tmpPC = pc_arr[p];
	            if (instance_exists(tmpPC)) {
	                var tmpSignal = ds_map_find_value(Field[tmpPC.cX, tmpPC.cY], "signal");
	                if (!tmpSignal)
	                    isExtra = false;
	            }
	        }
	    }
	    if (isExtra) {
	        ds_map_replace(Field[cX, cY], "content", -1);
	        ds_map_replace(Field[cX, cY], "contentType", item.Empty);
	        ds_map_replace(Field[cX, cY], "signal", false);
	        ds_map_replace(Field[cX, cY], "searchIndex", 0);
	        ds_map_replace(Field[cX, cY], "portIndex", -1);
	        ds_map_replace(Field[cX, cY], "connectionLimit", false);
	        ds_map_replace(Field[cX, cY], "leftPlugged", false);
	        ds_map_replace(Field[cX, cY], "upPlugged", false);
	        ds_map_replace(Field[cX, cY], "rightPlugged", false);
	        ds_map_replace(Field[cX, cY], "downPlugged", false);
	        if (cellValid(cX-1, cY)) ds_map_replace(Field[cX-1, cY], "rightPlugged", false);
	        if (cellValid(cX+1, cY)) ds_map_replace(Field[cX+1, cY], "leftPlugged", false);
	        if (cellValid(cX, cY-1)) ds_map_replace(Field[cX, cY-1], "downPlugged", false);
	        if (cellValid(cX, cY+1)) ds_map_replace(Field[cX, cY+1], "upPlugged", false);
        
	        instance_destroy();
	    }
	}
	with(obj_Server) {
	    if (!cellValid(cX, cY-2) or !ds_map_find_value(Field[cX, cY-2], "downPlugged")) {
	        w[UP] = false;
	        ds_map_replace(Field[cX, cY-1], "upPlugged", false);
	        ds_map_replace(Field[cX, cY], "upPlugged", false);
	    }
	    if (!cellValid(cX-1, cY) or !ds_map_find_value(Field[cX-1, cY], "rightPlugged")) {
	        w[LEFT] = false;
	        ds_map_replace(Field[cX, cY], "leftPlugged", false);
	    }
	    if (!cellValid(cX+1, cY) or !ds_map_find_value(Field[cX+1, cY], "leftPlugged")) {
	        w[RIGHT] = false;
	        ds_map_replace(Field[cX, cY], "rightPlugged", false);
	    }
	    if (!cellValid(cX, cY+1) or !ds_map_find_value(Field[cX, cY+1], "upPlugged")) {
	        w[DOWN] = false;
	        ds_map_replace(Field[cX, cY], "downPlugged", false);
	    }
	    portsCount = 0;
	    if (w[LEFT]) portsCount += 1;
	    if (w[UP]) portsCount += 1;
	    if (w[DOWN]) portsCount += 1;
	    if (w[RIGHT]) portsCount += 1;
	    lastPort = 0;
	}



}
