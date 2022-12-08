function moveItem(argument0, argument1, argument2) {
	// moveItem(new_cX, new_cY, self.id);

	var _cX = argument0;
	var _cY = argument1;
	var _item = argument2;

	if (cellValid(_cX, _cY)) {
	    var _content = ds_map_find_value(Field[_cX, _cY], "content");
	    var _cType = ds_map_find_value(Field[_cX, _cY], "contentType");
	    var _icX = _item.cX;
	    var _icY = _item.cY;
    
	    if (_cType != item.Server and _cType != item.Block) {
	        _content.x = _icX*100 + 70;
	        _content.y = _icY*100 + 150;
	        _content.cX = _icX;
	        _content.cY = _icY;
	        ds_map_replace(Field[_item.cX, _item.cY], "contentType", _cType);
	        ds_map_replace(Field[_item.cX, _item.cY], "content", _content);
	        ds_map_replace(Field[_item.cX, _item.cY], "signal", false);
	        if (_content.selfPC != -1) {
	            _content.selfPC.x = _icX*100 + 70;
	            _content.selfPC.y = _icY*100 + 150;
	            _content.selfPC.cX = _icX;
	            _content.selfPC.cY = _icY;
	            ds_map_replace(Field[_item.cX, _item.cY], "contentType", item.PC);
	        }
	        _item.x = _cX*100 + 70;
	        _item.y = _cY*100 + 150;
	        _item.cX = _cX;
	        _item.cY = _cY;
	        ds_map_replace(Field[_cX, _cY], "contentType", _item.itemType);
	        ds_map_replace(Field[_cX, _cY], "content", _item);
	        if (_item.selfPC != -1) {
	            _item.selfPC.x = _cX*100 + 70;
	            _item.selfPC.y = _cY*100 + 150;
	            _item.selfPC.cX = _cX;
	            _item.selfPC.cY = _cY;
	            ds_map_replace(Field[_cX, _cY], "contentType", item.PC);
	        }
	    } else {
	        _item.x = _item.cX*100 + 70;
	        _item.y = _item.cY*100 + 150;
	        if (_item.selfPC != -1) {
	            _item.selfPC.x = _item.cX*100 + 70;
	            _item.selfPC.y = _item.cY*100 + 150;
	        }
	        return 0;
	    }
	}
	fillWiresBySignal(autoFillWires);



}
