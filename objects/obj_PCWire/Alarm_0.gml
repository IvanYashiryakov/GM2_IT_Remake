/// @description Rotation

if (clockwiseRotation) {
    // Clockwise
    if (image_angle mod 90 != 0) {
        image_angle -= 5;
        alarm[0] = 1;
    } else {
        var wTemp = w[LEFT];
        w[LEFT] = w[DOWN];
        w[DOWN] = w[RIGHT];
        w[RIGHT] = w[UP];
        w[UP] = wTemp;
        freeze = false;
        rMousePressed = false;
        lMousePressed = false;
        fillWiresBySignal(autoFillWires);
    }
} else {
    // Anti-Clockwise
    if (image_angle mod 90 != 0) {
        image_angle += 5;
        alarm[0] = 1;
    } else {
        var wTemp = w[LEFT];
        w[LEFT] = w[UP];
        w[UP] = w[RIGHT];
        w[RIGHT] = w[DOWN];
        w[DOWN] = wTemp;
        freeze = false;
        rMousePressed = false;
        lMousePressed = false;
        fillWiresBySignal(autoFillWires);
    }
}

