function wiresRndRotation() {
	// wiresRndRotation();

	with (obj_Wire) {
	    randomize();
	    var _rnd = irandom(3);
	    image_angle += 90 * _rnd;
	    for (var i = 0; i < _rnd; i++) {
	        var wTemp = w[LEFT];
	        w[LEFT] = w[UP];
	        w[UP] = w[RIGHT];
	        w[RIGHT] = w[DOWN];
	        w[DOWN] = wTemp;
	    }
	}
	with (obj_PCWire) {
	    randomize();
	    var _rnd = irandom(3);
	    image_angle += 90 * _rnd;
	    for (var i = 0; i < _rnd; i++) {
	        var wTemp = w[LEFT];
	        w[LEFT] = w[UP];
	        w[UP] = w[RIGHT];
	        w[RIGHT] = w[DOWN];
	        w[DOWN] = wTemp;
	    }
	}
	with(obj_Server) {
	    randomize();
	    var _rnd = irandom(7);
	    for (var i = 0; i < _rnd; i++) {
	        serverRotation();
	    }
	}
	fillWiresBySignal(autoFillWires);



}
