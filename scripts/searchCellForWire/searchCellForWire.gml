function searchCellForWire(argument0, argument1, argument2, argument3, argument4, argument5) {
	// searchCellForWire(cX, cY, dirFromSrv, prevWire, searchIndex, portIndex);

	var _cX = argument0;
	var _cY = argument1;
	var _dirFromSrv = argument2
	var _pWire = argument3;
	var _searchIndex = argument4;
	var _portIndex = argument5;
	var _newWire = -1;

	if (cellValid(_cX, _cY) and !ds_map_find_value(Field[_cX, _cY], "connectionLimit")) {
	    var _current_sIndex = ds_map_find_value(Field[_cX, _cY], "searchIndex");
	    var _pIndex = ds_map_find_value(Field[_cX, _cY], "portIndex");
	    if (_current_sIndex == _searchIndex/* and (_pIndex == _portIndex or _pIndex == -1)*/) {
	        var _currentType = ds_map_find_value(Field[_cX, _cY], "contentType");
	        if (_currentType == item.Empty) {
	            _newWire = createItem(item.Wire, _cX, _cY);
	            _newWire.dirFromSrv = _dirFromSrv;
	        } else if (_currentType == item.Wire) {
	            _newWire = ds_map_find_value(Field[_cX, _cY], "content");
	            updateConnectionLimit(_cX, _cY);
	        }
	    } else return -1;
	    if (_pWire != -1) {
	        var pluggedSide = "noPlugged";
	        switch(_dirFromSrv) {
	            case 0: pluggedSide = "leftPlugged"; break;
	            case 1: pluggedSide = "upPlugged"; break;
	            case 2: pluggedSide = "rightPlugged"; break;
	            case 3: pluggedSide = "downPlugged"; break;
	        }
	        ds_map_replace(Field[_pWire.cX, _pWire.cY], pluggedSide, true);
	        updateConnectionLimit(_pWire.cX, _pWire.cY);
	    }
    
	    _pWire = _newWire;
	    var pluggedSide = "noPlugged";
	    switch(_dirFromSrv) {
	        case 0: pluggedSide = "rightPlugged"; break;
	        case 1: pluggedSide = "downPlugged"; break;
	        case 2: pluggedSide = "leftPlugged"; break;
	        case 3: pluggedSide = "upPlugged"; break;
	    }
	    ds_map_replace(Field[_cX, _cY], pluggedSide, true);
	    updateConnectionLimit(_cX, _cY);
	    return _pWire;
	}
	return -1;




}
