function createRndItem(argument0) {
	// createRndItem(item.Type);

	var _cX = -1;
	var _cY = -1;

	switch (argument0) {
	    case item.Server:
	        randomize();
	        _cX = irandom(FWidth-1);
	        _cY = 1 + irandom(FHeight-2);
	        return createServer(_cX, _cY);
	        break;
	    case item.PC:
	        var _goodCell = false;
	        var _breaker = 0;
	        do {
	            _breaker++;
	            randomize();
	            _cX = irandom(FWidth-1);
	            _cY = irandom(FHeight-1);
	            if (cellTypeEquals(_cX, _cY, item.Empty)) {
	                /*and (cellTypeEquals(_cX-1, _cY, item.Empty)
	                    or cellTypeEquals(_cX+1, _cY, item.Empty)
	                    or cellTypeEquals(_cX, _cY+1, item.Empty)
	                    or cellTypeEquals(_cX, _cY-1, item.Empty))) {*/
	                _goodCell = true;
	                return createItem(argument0, _cX, _cY);
	            }
	            if (_breaker > 100)
	                return -1;
	        } until(_goodCell)
	        break;
	}




}
