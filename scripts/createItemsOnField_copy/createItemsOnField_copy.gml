function createItemsOnField_copy(argument0) {
	// createItemsOnField(ServersCount, PCsCount);

	var srv;
	var port_counter = 0;
	var pc_count = argument0;
	pc_count = 5;
	var pc_array;
	var pc_counter = 0;
	var cX;
	var cY;
	var pcCountForPort;

	//srv = createRndItem(item.Server);
	srv = createServer(2, 4);
	randomize();
	switch (srv.portsCount) {
	    case 1: pcCountForPort[0] = pc_count; break;
	    case 2: pcCountForPort[0] = 1 + irandom(pc_count-2);
	            pcCountForPort[1] = pc_count; break;
	    case 3: pcCountForPort[0] = 1 + irandom(pc_count - 3);
	            pcCountForPort[1] = pcCountForPort[0] + 1 + irandom(pc_count - 2 - pcCountForPort[0]);
	            pcCountForPort[2] = pc_count; break;
	}
	//pc_array[0] = createItem(item.PC, 1, 5);

	for (var iW = 0; iW < 4; iW++) {
	    switch (iW) {
	        case 0: srv_cX = srv.cX-1;   srv_cY = srv.cY;     break;
	        case 1: srv_cX = srv.cX;     srv_cY = srv.cY-2;   break;
	        case 2: srv_cX = srv.cX+1;   srv_cY = srv.cY;     break;
	        case 3: srv_cX = srv.cX;     srv_cY = srv.cY+1;   break;
	    }
	    if (srv.w[iW]) {
	        ds_map_replace(Field[srv_cX, srv_cY], "portIndex", iW);
	        //ds_map_replace(Field[srv_cX, srv_cY], "contentType", item.Wire);
	    }
	}
	// генерируем PC для каждого порта отдельно
	var srv_cX;
	var srv_cY;
	for (var iW = 0; iW < 4; iW++) {
	    switch (iW) {
	        case 0: srv_cX = srv.cX-1;   srv_cY = srv.cY;     break;
	        case 1: srv_cX = srv.cX;     srv_cY = srv.cY-2;   break;
	        case 2: srv_cX = srv.cX+1;   srv_cY = srv.cY;     break;
	        case 3: srv_cX = srv.cX;     srv_cY = srv.cY+1;   break;
	    }
	    if (srv.w[iW]) {
	        for (var k = pc_counter; k < pcCountForPort[port_counter]; k++) {
	            pc_array[k] = noone;
	            var goodCell = false;
	            do {
	                if (instance_exists(pc_array[k]))
	                    with (pc_array[k]) {
	                        if (itemType == item.PC) {
	                            ds_map_replace(Field[cX, cY], "content", noone);
	                            ds_map_replace(Field[cX, cY], "contentType", item.Empty);
	                            ds_map_replace(Field[cX, cY], "portIndex", -1);
	                            instance_destroy();
	                        }
	                    }
	                //pc_array[k] = createRndItem(item.PC);
	                var kX = 0;
	                var kY = 0;
	                switch (k) {
	                    case 0: kX = 1; kY = 5; break;
	                    case 1: kX = 0; kY = 5; break;
	                    case 2: kX = 3; kY = 3; break;
	                    case 3: kX = 3; kY = 1; break;
	                    case 4: kX = 5; kY = 1; break;
	                }
	                pc_array[k] = createItem(item.PC, kX, kY);
	                ds_map_replace(Field[kX, kY], "portIndex", iW);
                
	                if (pcCountForPort[port_counter] == 1 and pc_array[k].cX == srv_cX and pc_array[k].cY == srv_cY) {
	                    goodCell = true;
	                } else if (pc_array[k].cX != srv.cX-1 or pc_array[k].cY != srv.cY)
	                        if (pc_array[k].cX != srv.cX+1 or pc_array[k].cY != srv.cY)
	                            if (pc_array[k].cX != srv.cX or pc_array[k].cY != srv.cY-2)
	                                if (pc_array[k].cX != srv.cX or pc_array[k].cY != srv.cY+1)
	                                    goodCell = true;
	            } until (goodCell)
	            var tmpType = ds_map_find_value(Field[srv_cX, srv_cY], "contentType");
	            if (tmpType == item.PC)
	                continue;
	            //----------------------------------------------//
	            for (var ccX = 0; ccX < FWidth; ccX++)
	                for (var ccY = 0; ccY < FHeight; ccY++) {
	                    ds_map_replace(Field[ccX, ccY], "searchIndex", 0);
	                    var tmpType = ds_map_find_value(Field[ccX, ccY], "contentType");
	                    if (tmpType == item.Empty)
	                        ds_map_replace(Field[ccX, ccY], "portIndex", -1);
	                }
	            // прокладываем провода от Server к каждому PC
	            cX = srv_cX;
	            cY = srv_cY;
	            var pc_cX = pc_array[k].cX;
	            var pc_cY = pc_array[k].cY;
	            var XForSearch = ds_list_create();
	            var YForSearch = ds_list_create();
	            var searchIndex = 1;
	            ds_map_replace(Field[srv.cX, srv.cY], "searchIndex", searchIndex);
	            ds_map_replace(Field[srv.cX, srv.cY-1], "searchIndex", searchIndex);
	            ds_list_add(XForSearch, cX);
	            ds_list_add(YForSearch, cY);
	            searchIndex += 1;
	            ds_map_replace(Field[cX, cY], "searchIndex", searchIndex);
	            ds_map_replace(Field[cX, cY], "portIndex", iW);
	            var endSearch = false;
	            while (!endSearch) {
	                var cellsForSearch_count = ds_list_size(XForSearch);
	                searchIndex += 1;
	                for (var i = 0; i < cellsForSearch_count; i++) {
	                    cX = ds_list_find_value(XForSearch, i);
	                    cY = ds_list_find_value(YForSearch, i);
	                    if (searchPCInCell(cX, cY+1, pc_cX, pc_cY, XForSearch, YForSearch, searchIndex, cX, cY))        { endSearch = true; break; }
	                    else if (searchPCInCell(cX, cY-1, pc_cX, pc_cY, XForSearch, YForSearch, searchIndex, cX, cY))   { endSearch = true; break; }
	                    else if (searchPCInCell(cX+1, cY, pc_cX, pc_cY, XForSearch, YForSearch, searchIndex, cX, cY))   { endSearch = true; break; }
	                    else if (searchPCInCell(cX-1, cY, pc_cX, pc_cY, XForSearch, YForSearch, searchIndex, cX, cY))   { endSearch = true; break; }
	                }
	                for (var i = 0; i < cellsForSearch_count; i++) {
	                    ds_list_delete(XForSearch, 0);
	                    ds_list_delete(YForSearch, 0);
	                }
	                if (ds_list_empty(XForSearch) or endSearch) {
	                    ds_list_destroy(XForSearch);
	                    ds_list_destroy(YForSearch);
	                    break;
	                }
	            }
	            var prevWire = -1;
	            var currentWire = -1;
	            if (cellValid(pc_cX-1, pc_cY)) {
	                if (ds_map_find_value(Field[pc_cX-1, pc_cY], "contentType") == item.Server
	                    and ds_map_find_value(Field[pc_cX-1, pc_cY], "content").w[2]
	                    and ds_map_find_value(Field[pc_cX-1, pc_cY], "content").cY == pc_cY) searchIndex = 0;
	            } else if (cellValid(pc_cX+1, pc_cY)) {
	                if (ds_map_find_value(Field[pc_cX+1, pc_cY], "contentType") == item.Server
	                    and ds_map_find_value(Field[pc_cX+1, pc_cY], "content").w[0]
	                    and ds_map_find_value(Field[pc_cX+1, pc_cY], "content").cY == pc_cY) searchIndex = 0;
	            } else if (cellValid(pc_cX, pc_cY-1)) {
	                if (ds_map_find_value(Field[pc_cX, pc_cY-1], "contentType") == item.Server
	                    and ds_map_find_value(Field[pc_cX, pc_cY-1], "content").w[3]) searchIndex = 0;
	            } else if (cellValid(pc_cX, pc_cY+1)) {
	                if (ds_map_find_value(Field[pc_cX, pc_cY+1], "contentType") == item.Server
	                    and ds_map_find_value(Field[pc_cX, pc_cY+1], "content").w[1]) searchIndex = 0;
	            }
	            while (searchIndex > 1) {
	                searchIndex -= 1;
	                currentWire = searchCellForWire(pc_cX-1, pc_cY, LEFT, prevWire, searchIndex, iW);
	                if (currentWire != -1) {
	                    prevWire = currentWire;
	                    pc_cX -= 1;
	                    continue;
	                }
	                currentWire = searchCellForWire(pc_cX+1, pc_cY, RIGHT, prevWire, searchIndex, iW);
	                if (currentWire != -1) {
	                    prevWire = currentWire;
	                    pc_cX += 1;
	                    continue;
	                }
	                currentWire = searchCellForWire(pc_cX, pc_cY-1, UP, prevWire, searchIndex, iW);
	                if (currentWire != -1) {
	                    prevWire = currentWire;
	                    pc_cY -= 1;
	                    continue;
	                }
	                currentWire = searchCellForWire(pc_cX, pc_cY+1, DOWN, prevWire, searchIndex, iW);
	                if (currentWire != -1) {
	                    prevWire = currentWire;
	                    pc_cY += 1;
	                    continue;
	                }
	            }
	        }
	        pc_counter = pcCountForPort[port_counter];
	        port_counter += 1;
	    }
	}
	wiresSetSprite();




}
