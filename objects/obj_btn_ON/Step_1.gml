if (isMouseOnObj(self))
    if (mouse_check_button_pressed(mb_left)) {
        if (image_index == 0) {
            //image_index = 1;
            fillWiresBySignal(true);
        } else {
            //image_index = 0;
            fillWiresBySignal(false);
        }
    }


