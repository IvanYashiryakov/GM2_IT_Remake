function resetField() {
	// resetField(FWidth, FHeight);

	with (obj_Server) { instance_destroy(); }
	with (obj_Wire)   { instance_destroy(); }
	with (obj_PC)     { instance_destroy(); }
	with (obj_PCWire) { instance_destroy(); }
	with (obj_Block)  { instance_destroy(); }

	for (var cX = 0; cX < FWidth; cX++) {
	    for (var cY = 0; cY < FHeight; cY++) {
	        ds_map_replace(Field[cX, cY], "content", -1);
	        ds_map_replace(Field[cX, cY], "contentType", item.Empty);
	        ds_map_replace(Field[cX, cY], "cellX", cX);
	        ds_map_replace(Field[cX, cY], "cellY", cY);
	        ds_map_replace(Field[cX, cY], "signal", false);
	        ds_map_replace(Field[cX, cY], "searchIndex", 0);
	        ds_map_replace(Field[cX, cY], "portIndex", -1);
        
	        ds_map_replace(Field[cX, cY], "connectionLimit", false);
	        ds_map_replace(Field[cX, cY], "leftPlugged", false);
	        ds_map_replace(Field[cX, cY], "upPlugged", false);
	        ds_map_replace(Field[cX, cY], "rightPlugged", false);
	        ds_map_replace(Field[cX, cY], "downPlugged", false);
	    }
	}
	needReset = false;




}
