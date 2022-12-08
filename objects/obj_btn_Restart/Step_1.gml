if (isMouseOnObj(self))
    if (mouse_check_button_pressed(mb_left)) {
        resetGame();
        if (instance_exists(obj_Game_02)) {
            with (obj_Wire)   {
                randomize();
                moveItem(irandom(FWidth), irandom(FHeight), self.id);
            }
            with (obj_PCWire)   {
                randomize();
                moveItem(irandom(FWidth), irandom(FHeight), self.id);
            }
        }
    }


