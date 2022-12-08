function placeOnField(argument0, argument1, argument2) {
	// placeOnField(cX, cY, obj);
	var xx = argument0;
	var yy = argument1;
	if (xx < 0 or yy < 0) {
	    randomize();
	    xx = irandom(Width-1);
	    yy = irandom(Height-1);
	}

	argument2.x = 70 + xx * 100;
	argument2.y = 50 + yy * 100;




}
