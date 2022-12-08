function searchSignalInCell(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8) {
	// searchSignalInCell(cX, cY+1, XForSearch, YForSearch, searchIndex, sidePlugged(text_var));

	var _cX = argument0;
	var _cY = argument1;
	var _XForSearch = argument2;
	var _YForSearch = argument3;
	var _searchIndex = argument4;
	var _sidePlugged = argument5;
	var _prevX = argument6;
	var _prevY = argument7;
	var _prevSidePlugged = argument8;
	var _resault = false;

	if (cellValid(_cX, _cY)) {
	    var _current_sIndex = ds_map_find_value(Field[_cX, _cY], "searchIndex");
	    var _tmpType = ds_map_find_value(Field[_cX, _cY], "contentType");
	    if (_current_sIndex == 0 and _tmpType != item.PC) {
	        if (updateConnectionLimit(_cX, _cY)) {
	            if (_tmpType == item.Empty) {
	                ds_list_add(_XForSearch, _cX);
	                ds_list_add(_YForSearch, _cY);
	                ds_map_replace(Field[_cX, _cY], _sidePlugged, true);
	                ds_map_replace(Field[_prevX, _prevY], _prevSidePlugged, true);
	                updateConnectionLimit(_cX, _cY);
	                updateConnectionLimit(_prevX, _prevY);
	                ds_map_replace(Field[_cX, _cY], "searchIndex", _searchIndex);
	            } else if (_tmpType == item.Wire
	                    and !ds_map_find_value(Field[_cX, _cY], "connectionLimit")) {
	                ds_map_replace(Field[_cX, _cY], _sidePlugged, true);
	                ds_map_replace(Field[_prevX, _prevY], _prevSidePlugged, true);
	                updateConnectionLimit(_cX, _cY);
	                updateConnectionLimit(_prevX, _prevY);
	                ds_map_replace(Field[_cX, _cY], "searchIndex", _searchIndex);
	                ds_map_replace(Field[_cX, _cY], _sidePlugged, false);
	                ds_map_replace(Field[_prevX, _prevY], _prevSidePlugged, false);
	                _resault = true;
	            } else if (_tmpType == item.Server
	                    and ds_map_find_value(Field[_cX, _cY], _sidePlugged)) {
	                ds_map_replace(Field[_prevX, _prevY], _prevSidePlugged, true);
	                updateConnectionLimit(_prevX, _prevY);
	                ds_map_replace(Field[_cX, _cY], "searchIndex", _searchIndex);
	                _resault = true;
	            }
	        }
	    }
	}
	return _resault;




}
