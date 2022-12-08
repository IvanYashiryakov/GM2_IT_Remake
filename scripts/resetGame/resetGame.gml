/// @description  resetGame();
function resetGame() {
	resetField();

	createItemsOnField_new(GameDifficulty);
	wiresSetSprite();
	with(obj_PC) {
	    if (!ds_map_find_value(Field[cX, cY], "signal")) {
	        needReset = true;
	        resetGame();
	        exit;
	    }
	}
	/*
	with(obj_PCWire) {
	    var _ddir;
	    _ddir[0] = -1;
	    var _dd = 0;
	    if (cellTypeEquals(cX-1, cY, item.Empty)) { _ddir[_dd] = LEFT;  _dd++; }
	    if (cellTypeEquals(cX+1, cY, item.Empty)) { _ddir[_dd] = RIGHT; _dd++; }
	    if (cellTypeEquals(cX, cY-1, item.Empty)) { _ddir[_dd] = UP;    _dd++; }
	    if (cellTypeEquals(cX, cY+1, item.Empty)) { _ddir[_dd] = DOWN;  _dd++; }
	    var ddd = irandom(_dd);
	    switch(_ddir[ddd]) {
	        case LEFT:
	            moveItem(cX-1, cY, self.id);
	            createItem(item.Wire, cX+1, cY);
	            break;
	        case UP:
	            moveItem(cX, cY-1, self.id);
	            createItem(item.Wire, cX, cY+1);
	            break;
	        case RIGHT:
	            moveItem(cX+1, cY, self.id);
	            createItem(item.Wire, cX-1, cY);
	            break;
	        case DOWN:
	            moveItem(cX, cY+1, self.id);
	            createItem(item.Wire, cX, cY-1);
	            break;
	        default: break;
	    }
	}
	*/
	if (!needReset) {
	    if (GameType == 2) {
	        for (var ccX = 0; ccX < FWidth; ccX++) {
	            for (var ccY = 0; ccY < FHeight; ccY++) {
	                var cType = ds_map_find_value(Field[ccX, ccY], "contentType");
	                if (cType == item.Empty) {
	                    createItem(item.Block, ccX, ccY);
	                }
	            }
	        }
	    }
	    wiresDeleteExtra();
	    wiresSetSprite();
	    wiresRndRotation();
	}



}
