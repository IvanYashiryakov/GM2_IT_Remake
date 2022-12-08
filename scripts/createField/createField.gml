function createField() {
	// createField(FWidth, FHeight);
	var w = FWidth;
	var h = FHeight;

	for (var cX = 0; cX < w; cX++) {
	    for (var cY = 0; cY < h; cY++) {
	        Field[cX, cY] = ds_map_create();
	        ds_map_add(Field[cX, cY], "content", -1);
	        ds_map_add(Field[cX, cY], "contentType", item.Empty);
	        ds_map_add(Field[cX, cY], "cellX", cX);
	        ds_map_add(Field[cX, cY], "cellY", cY);
	        ds_map_add(Field[cX, cY], "signal", false);
	        ds_map_add(Field[cX, cY], "searchIndex", 0);
	        ds_map_add(Field[cX, cY], "portIndex", -1);
        
	        ds_map_add(Field[cX, cY], "connectionLimit", false);
	        ds_map_add(Field[cX, cY], "leftPlugged", false);
	        ds_map_add(Field[cX, cY], "upPlugged", false);
	        ds_map_add(Field[cX, cY], "rightPlugged", false);
	        ds_map_add(Field[cX, cY], "downPlugged", false);
	    }
	}




}
