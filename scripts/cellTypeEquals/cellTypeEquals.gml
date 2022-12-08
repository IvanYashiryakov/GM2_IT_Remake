function cellTypeEquals(argument0, argument1, argument2) {
	// cellTypeEquals(cX, cY, item.Type);
	if (cellValid(argument0, argument1))
	    return ds_map_find_value(Field[argument0, argument1], "contentType") == argument2;
	else
	    return false;




}
