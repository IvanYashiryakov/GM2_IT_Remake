function createItemsOnField_new(argument0) {
	// createItemsOnField_new(GameDifficulty);

	var pc_count;
	var srv = createRndItem(item.Server);
	var pc_array;
	var cX, cY;

	randomize();
	switch(argument0) {
	    case 0: pc_count = 3 + irandom(4); break;
	    case 1: pc_count = 7 + irandom(5); break;
	    case 2: pc_count = 14 + irandom(4); break;
	}
	// генерируем PC для каждого порта отдельно
	for (var k = 0; k < pc_count; k++) {
	    var goodCell = false;
	    pc_array[k] = createRndItem(item.PC);
	    if (pc_array[k] == -1) continue;
	    pc_array[k].spawnNumber = k + 1;
	    for (var ccX = 0; ccX < FWidth; ccX++)
	        for (var ccY = 0; ccY < FHeight; ccY++)
	            ds_map_replace(Field[ccX, ccY], "searchIndex", 0);
	    // прокладываем провода от PC к Server
	    var pc_cX = pc_array[k].cX;
	    var pc_cY = pc_array[k].cY;
	    var XForSearch = ds_list_create();
	    var YForSearch = ds_list_create();
	    var searchIndex = 1;
	    ds_map_replace(Field[pc_cX, pc_cY], "searchIndex", searchIndex);
	    ds_list_add(XForSearch, pc_cX);
	    ds_list_add(YForSearch, pc_cY);
	    var endSearch = false;
	    var wBreaker = 0;
	    var dirFromSrv = -1;
	    var cellsCountForSearch;
	    while (!endSearch) {
	        wBreaker++;
	        cellsCountForSearch = ds_list_size(XForSearch);
	        searchIndex += 1;
	        for (var i = 0; i < cellsCountForSearch; i++) {
	            cX = ds_list_find_value(XForSearch, i);
	            cY = ds_list_find_value(YForSearch, i);
	            if (searchSignalInCell(cX, cY+1, XForSearch, YForSearch, searchIndex, "upPlugged", cX, cY, "downPlugged"))          { endSearch = true; dirFromSrv = DOWN; cY++; break; }
	            else if (searchSignalInCell(cX, cY-1, XForSearch, YForSearch, searchIndex, "downPlugged", cX, cY, "upPlugged"))     { endSearch = true; dirFromSrv = UP; cY--; break; }
	            else if (searchSignalInCell(cX+1, cY, XForSearch, YForSearch, searchIndex, "leftPlugged", cX, cY, "rightPlugged"))  { endSearch = true; dirFromSrv = RIGHT; cX++; break; }
	            else if (searchSignalInCell(cX-1, cY, XForSearch, YForSearch, searchIndex, "rightPlugged", cX, cY, "leftPlugged"))  { endSearch = true; dirFromSrv = LEFT; cX--; break; }
	        }
	        for (var i = 0; i < cellsCountForSearch; i++) {
	            ds_list_delete(XForSearch, 0);
	            ds_list_delete(YForSearch, 0);
	        }
	        if (ds_list_empty(XForSearch) or endSearch) {
	            ds_list_destroy(XForSearch);
	            ds_list_destroy(YForSearch);
	            endSearch = true;
	            break;
	        } //if (wBreaker > 200) endSearch = true;
	    }
                
	    for (var ccX = 0; ccX < FWidth; ccX++)
	        for (var ccY = 0; ccY < FHeight; ccY++) {
	            var tmpType = ds_map_find_value(Field[ccX, ccY], "contentType");
	            if (tmpType == item.Empty) {
	                ds_map_replace(Field[ccX, ccY], "leftPlugged", false);
	                ds_map_replace(Field[ccX, ccY], "upPlugged", false);
	                ds_map_replace(Field[ccX, ccY], "rightPlugged", false);
	                ds_map_replace(Field[ccX, ccY], "downPlugged", false);
	                ds_map_replace(Field[ccX, ccY], "connectionLimit", false);
	            }
	        }
	    var prevWire = ds_map_find_value(Field[cX, cY], "content");
	    searchIndex -= 1;
	    while (searchIndex > 1) {
	        if (searchCellForWire2(cX-1, cY, dirFromSrv, RIGHT, searchIndex, cX, cY, k))     { cX -= 1; }
	            else if (searchCellForWire2(cX+1, cY, dirFromSrv, LEFT, searchIndex, cX, cY, k)) { cX += 1; }
	            else if (searchCellForWire2(cX, cY-1, dirFromSrv, DOWN, searchIndex, cX, cY, k)) { cY -= 1; }
	            else if (searchCellForWire2(cX, cY+1, dirFromSrv, UP, searchIndex, cX, cY, k))   { cY += 1; }
	            searchIndex -= 1;
	            dirFromSrv = -1;
	        }
	        if (searchIndex == 1) {
	            ds_map_replace(Field[pc_cX, pc_cY], "leftPlugged", false);
	            ds_map_replace(Field[pc_cX, pc_cY], "upPlugged", false);
	            ds_map_replace(Field[pc_cX, pc_cY], "rightPlugged", false);
	            ds_map_replace(Field[pc_cX, pc_cY], "downPlugged", false);
	            if (pc_cX - cX > 0) {
	                ds_map_replace(Field[pc_cX, pc_cY], "leftPlugged", true);
	                ds_map_replace(Field[cX, cY], "rightPlugged", true);
	            }
	            else if (pc_cX - cX < 0) {
	                ds_map_replace(Field[pc_cX, pc_cY], "rightPlugged", true);
	                ds_map_replace(Field[cX, cY], "leftPlugged", true);
	            }
	            else if (pc_cY - cY > 0) {
	                ds_map_replace(Field[pc_cX, pc_cY], "upPlugged", true);
	                ds_map_replace(Field[cX, cY], "downPlugged", true);
	            }
	            else if (pc_cY - cY < 0) {
	                ds_map_replace(Field[pc_cX, pc_cY], "downPlugged", true);
	                ds_map_replace(Field[cX, cY], "upPlugged", true);
	            }
	        }
	        with(obj_Wire) {
	            ds_map_replace(Field[cX, cY], "signal", true);
	        }
	    }
	if (instance_exists(obj_Game)) {
	    obj_Game.pc_array = pc_array;
	} else if (instance_exists(obj_Game_02)) {
	    obj_Game_02.pc_array = pc_array;
	}




}
