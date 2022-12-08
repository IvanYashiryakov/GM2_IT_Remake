if (isMouseOnObj(self))
    if (mouse_check_button_pressed(mb_left)) {
        image_index++;
        if (image_index == 3)
            image_index = 0;
        GameDifficulty = image_index;
    }


