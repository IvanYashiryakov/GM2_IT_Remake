function wiresSetSprite() {
	// wiresSetSprite();

	with(obj_Wire) {
	    var plugCount = 0;
	    if (ds_map_find_value(Field[cX, cY], "leftPlugged"))    plugCount += 1;
	    if (ds_map_find_value(Field[cX, cY], "upPlugged"))      plugCount += 1;
	    if (ds_map_find_value(Field[cX, cY], "rightPlugged"))   plugCount += 1;
	    if (ds_map_find_value(Field[cX, cY], "downPlugged"))    plugCount += 1;
	    switch (plugCount) {
	        case 2:
	            if ((ds_map_find_value(Field[cX, cY], "leftPlugged")
	                xor ds_map_find_value(Field[cX, cY], "rightPlugged"))
	                or (ds_map_find_value(Field[cX, cY], "upPlugged")
	                xor ds_map_find_value(Field[cX, cY], "downPlugged"))) {
                
	                sprite_index = spr_Wire_G;
	                image_angle = 0;
	                w[LEFT] = true;
	                w[UP] = false;
	                w[RIGHT] = false;
	                w[DOWN] = true;
	            }
	            break;
	        case 3:
	            sprite_index = spr_Wire_T;
	            image_angle = 0;
	            w[LEFT] = true;
	            w[UP] = false;
	            w[RIGHT] = true;
	            w[DOWN] = true;
	            break;
	    }
	    var wBreaker = 0;
	    while   !(ds_map_find_value(Field[cX, cY], "leftPlugged") == w[LEFT]
	            and ds_map_find_value(Field[cX, cY], "upPlugged") == w[UP]
	            and ds_map_find_value(Field[cX, cY], "rightPlugged") == w[RIGHT]
	            and ds_map_find_value(Field[cX, cY], "downPlugged") == w[DOWN]) {
	        wBreaker++;
	        var wTemp = w[LEFT];
	        w[LEFT] = w[DOWN];
	        w[DOWN] = w[RIGHT];
	        w[RIGHT] = w[UP];
	        w[UP] = wTemp;
	        image_angle -= 90;
	        if (wBreaker > 4) break;
	    }
	}
	with(obj_PCWire) {
	    var wBreaker = 0;
	    while   !(ds_map_find_value(Field[cX, cY], "leftPlugged") == w[LEFT]
	            and ds_map_find_value(Field[cX, cY], "upPlugged") == w[UP]
	            and ds_map_find_value(Field[cX, cY], "rightPlugged") == w[RIGHT]
	            and ds_map_find_value(Field[cX, cY], "downPlugged") == w[DOWN]) {
	        wBreaker++;
	        var wTemp = w[LEFT];
	        w[LEFT] = w[DOWN];
	        w[DOWN] = w[RIGHT];
	        w[RIGHT] = w[UP];
	        w[UP] = wTemp;
	        image_angle -= 90;
	        if (wBreaker > 4) break;
	    }
	}
	with(obj_Server) {
	    var wBreaker = 0;
	    while   !(ds_map_find_value(Field[cX, cY], "leftPlugged") == w[LEFT]
	            and ds_map_find_value(Field[cX, cY], "upPlugged") == w[UP]
	            and ds_map_find_value(Field[cX, cY], "rightPlugged") == w[RIGHT]
	            and ds_map_find_value(Field[cX, cY], "downPlugged") == w[DOWN]) {
	        wBreaker++;
	        serverRotation();
	        if (wBreaker > 8) break;
	    }
	}
	fillWiresBySignal(true);




}
