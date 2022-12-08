function isMouseOnObj(argument0) {
	// isMouseOnObj(obj);

	if ((abs(mouse_x-argument0.x) < argument0.spr_width/2)
	    and (abs(mouse_y-argument0.y) < argument0.spr_height/2))
	{ return true }
	else
	{ return false }




}
