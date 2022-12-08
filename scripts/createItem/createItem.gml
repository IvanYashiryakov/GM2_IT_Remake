function createItem(argument0, argument1, argument2) {
	// createItem(item.Type, cX, cY);

	var obj;
	var objType = argument0;
	var cX = argument1;
	var cY = argument2;

	switch (objType) {
	    case item.Block:
	        obj = instance_create(cX*100 + 70, cY*100 + 150, obj_Block);
	        ds_map_replace(Field[cX, cY], "content", obj);
	        break;
	    case item.Wire:
	        obj = instance_create(cX*100 + 70, cY*100 + 150, obj_Wire);
	        ds_map_replace(Field[cX, cY], "content", obj);
	        break;
	    case item.PC:
	        obj = instance_create(cX*100 + 70, cY*100 + 150, obj_PC);
	        obj.selfWire = instance_create(cX*100 + 70, cY*100 + 150, obj_PCWire);
	        obj.selfWire.cX = cX;
	        obj.selfWire.cY = cY;
	        obj.selfWire.selfPC = obj;
	        ds_map_replace(Field[cX, cY], "content", obj.selfWire);
	        break;
	}

	obj.cX = cX;
	obj.cY = cY;
	ds_map_replace(Field[cX, cY], "contentType", objType);
	return obj;



}
