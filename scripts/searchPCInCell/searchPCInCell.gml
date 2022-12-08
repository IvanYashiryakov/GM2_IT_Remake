function searchPCInCell(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	// searchPCInCell(cX, cY+1, pc_cX, pc_cY, XForSearch, YForSearch, searchIndex, prev_cX, prev_cY);

	var _cX = argument0;
	var _cY = argument1;
	var _pc_cX = argument2;
	var _pc_cY = argument3;
	var _XForSearch = argument4;
	var _YForSearch = argument5;
	var _searchIndex = argument6;
	var _pcX = argument7;
	var _pcY = argument8;

	//if (ds_map_find_value(Field[_pcX, _pcY], "connectionLimit"))
	//    return false;

	if (_pc_cX == _cX and _pc_cY == _cY)
	    return true;
                
	if (cellValid(_cX, _cY)) {
	    var _current_sIndex = ds_map_find_value(Field[_cX, _cY], "searchIndex");
	    if (_current_sIndex == 0) {
	        var _pIndex = ds_map_find_value(Field[_cX, _cY], "portIndex");
	        if (checkLimitForOneMoreConnection(_cX, _cY)) {
	            if ((cellTypeEquals(_cX, _cY, item.Empty) and !ds_map_find_value(Field[_pcX, _pcY], "connectionLimit"))
	                or (cellTypeEquals(_cX, _cY, item.Wire) and !ds_map_find_value(Field[_cX, _cY], "connectionLimit"))) {
	                ds_list_add(_XForSearch, _cX);
	                ds_list_add(_YForSearch, _cY);
	                ds_map_replace(Field[_cX, _cY], "searchIndex", _searchIndex);
	            }
	        } /*else if (cellTypeEquals(_cX, _cY, item.Wire)) {
	                ds_list_add(_XForSearch, _cX);
	                ds_list_add(_YForSearch, _cY);
	                ds_map_replace(Field[_cX, _cY], "searchIndex", _searchIndex);
	                ds_map_replace(Field[_cX, _cY], "connectionLimit", true);
	            }*/
	    }
	}
	return false;




}
