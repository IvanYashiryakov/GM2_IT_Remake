
if (isMouseOnObj(self) or canMove) {
    if (alarm[0] == -1)
        if (mouse_check_button_released(mb_left) and lMousePressed) {
            event_perform(ev_alarm, 0);
            lMousePressed = false;
        } else if (mouse_check_button_pressed(mb_left)) {
            lMousePressed = true;
        }
} else {
    lMousePressed = false;
}

