function scrFirstRunApp() {
	// scrFirstRunApp();

	default_width = 640;
	default_height = 1136;
	default_ratio = default_height/default_width;

	globalvar display_w;
	display_w = display_get_width();
	globalvar display_h;
	display_h = display_get_height();
	globalvar viewPort_w;
	viewPort_w = 0;
	globalvar viewPort_h;
	viewPort_h = 0;

	if (display_h/display_w < default_ratio) {
	    //xSize = display_h/default_ratio; ySize = display_h;
	    global.ratio = (display_h/default_height)/default_ratio;
	    viewPort_w = display_h/default_ratio;
	    viewPort_h = display_h;
	} else if (display_h/display_w > default_ratio) {
	    //xSize = display_w; ySize = display_w*default_ratio;
	    global.ratio = (display_w/default_width)/default_ratio;
	    viewPort_w = display_w;
	    viewPort_h = display_h/default_ratio;
	} else {
	    global.ratio = 1;
	    viewPort_w = display_w;
	    viewPort_h = display_h;
	}
	global.x_ratio = (display_w/default_width)/default_ratio;
	global.y_ratio = (display_h/default_height)/default_ratio;





}
