if (!freeze) {
    if (isMouseOnObj(self) or canMove) {
        if (alarm[0] == -1) {
            if ((mouse_check_button_released(mb_right) and rMousePressed)
                or (mouse_check_button_released(mb_left) and lMousePressed)) {
                if (!canMove) {
                    image_angle += shortIf(rMousePressed, -5, 5);
                    clockwiseRotation = rMousePressed;
                    rMousePressed = false;
                    lMousePressed = false;
                    freeze = true;
                    event_perform(ev_alarm, 0);
                } else {
                    moveItem(round((x-70)/100), round((y-150)/100), self.id);
                    //moveItem(round((x-70)/100), round((y-150)/100), selfPC);
                }
            } else if (mouse_check_button_pressed(mb_right)) {
                rMousePressed = true;
                alarm[1] = 7;
            } else if (mouse_check_button_pressed(mb_left)) {
                lMousePressed = true;
                alarm[1] = 7;
            } else if (mouse_check_button(mb_left) and canMove) {
                x = mouse_x;
                y = mouse_y;
                selfPC.x = mouse_x;
                selfPC.y = mouse_y;
            } else {
                canMove = false;
            }
            if (image_angle >= 360)
                image_angle -= 360;
            else if (image_angle <= -360)
                image_angle += 360;
        }
    }  else {
        lMousePressed = false;
        rMousePressed = false;
    }
}

/*if (!freeze)
    if (isMouseOnObj(self)) {
        if (alarm[0] == -1) {
            if (mouse_check_button_released(mb_right) and rMousePressed) {
                image_angle -= 5;
                clockwiseRotation = true;
                event_perform(ev_alarm, 0);
                rMousePressed = false;
            } else if (mouse_check_button_released(mb_left) and lMousePressed) {
                image_angle += 5;
                clockwiseRotation = false;
                event_perform(ev_alarm, 0);
                lMousePressed = false;
            } else if (mouse_check_button_pressed(mb_right)) {
                rMousePressed = true;
            } else if (mouse_check_button_pressed(mb_left)) {
                lMousePressed = true;
            }
            if (image_angle >= 360)
                image_angle -= 360;
            else if (image_angle <= -360)
                image_angle += 360;
        }
    } else {
        lMousePressed = false;
        rMousePressed = false;
    }
*/

/* */
/*  */
