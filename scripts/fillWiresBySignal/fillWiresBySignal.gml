function fillWiresBySignal(argument0) {
	// fillWiresBySignal(true);

	var _w = FWidth;
	var _h = FHeight;
	for (var ccX = 0; ccX < _w; ccX++) {
	    for (var ccY = 0; ccY < _h; ccY++) {
	        ds_map_replace(Field[ccX, ccY], "signal", false);
	    }
	}

	if (argument0) {
	    with(obj_btn_ON) {
	        image_index = 1;
	    }
	} else {
	    with(obj_btn_ON) {
	        image_index = 0;
	    }
	}
	
	fillWires(obj_Server, argument0);
}
