function searchCellForWire2(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7) {
	// searchCellForWire2(cX, cY, dirFromSrv, prevWire, searchIndex, spawnNumber);

	var _cX = argument0;
	var _cY = argument1;
	var _dirFromSrv = argument2;
	var _nextDir = argument3
	var _searchIndex = argument4;
	var _prev_cX = argument5;
	var _prev_cY = argument6;
	var _k = argument7;
	var _newWire = -1;

	if (cellValid(_cX, _cY)) {
	    var _current_sIndex = ds_map_find_value(Field[_cX, _cY], "searchIndex");
	    if (_current_sIndex == _searchIndex and (_dirFromSrv == _nextDir or _dirFromSrv == -1)) {
	        var _currentType = ds_map_find_value(Field[_cX, _cY], "contentType");
	        if (_currentType == item.Empty) {
	            _newWire = createItem(item.Wire, _cX, _cY);
	            _newWire.spawnNumber = _k + 1;
	            _newWire.dirFromSrv = _nextDir;
	            switch(_nextDir) {
	                case RIGHT: ds_map_replace(Field[_cX, _cY], "rightPlugged", true);
	                            ds_map_replace(Field[_prev_cX, _prev_cY], "leftPlugged", true); 
	                            break;
	                case DOWN:  ds_map_replace(Field[_cX, _cY], "downPlugged", true);
	                            ds_map_replace(Field[_prev_cX, _prev_cY], "upPlugged", true); 
	                            break;
	                case LEFT:  ds_map_replace(Field[_cX, _cY], "leftPlugged", true);
	                            ds_map_replace(Field[_prev_cX, _prev_cY], "rightPlugged", true); 
	                            break;
	                case UP:    ds_map_replace(Field[_cX, _cY], "upPlugged", true);
	                            ds_map_replace(Field[_prev_cX, _prev_cY], "downPlugged", true); 
	                            break;
	            }
	            //if (cellTypeEquals(_prev_cX, _prev_cY, item.Server)) serverLockPorts(_prev_cX, _prev_cY);
	        } else if (_currentType == item.Wire) {
	            _newWire = ds_map_find_value(Field[_cX, _cY], "content");
	            updateConnectionLimit(_cX, _cY);
	            if (!ds_map_find_value(Field[_cX, _cY], "connectionLimit")) {
	                switch(_nextDir) {
	                    case LEFT:  ds_map_replace(Field[_cX, _cY], "rightPlugged", true);
	                                ds_map_replace(Field[_prev_cX, _prev_cY], "leftPlugged", true); 
	                                break;
	                    case UP:    ds_map_replace(Field[_cX, _cY], "downPlugged", true);
	                                ds_map_replace(Field[_prev_cX, _prev_cY], "upPlugged", true); 
	                                break;
	                    case RIGHT: ds_map_replace(Field[_cX, _cY], "leftPlugged", true);
	                                ds_map_replace(Field[_prev_cX, _prev_cY], "rightPlugged", true); 
	                                break;
	                    case DOWN:  ds_map_replace(Field[_cX, _cY], "upPlugged", true);
	                                ds_map_replace(Field[_prev_cX, _prev_cY], "downPlugged", true); 
	                                break;
	                }
	                updateConnectionLimit(_cX, _cY);
	            }
	        }
	    } else return false;
	    return true;
	}
	return false;




}
