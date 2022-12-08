draw_set_font(debugFont);
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

_pcCount = instance_number(obj_PC);
//draw_text(50, 50, _pcCount);
draw_text(30, 925, string_hash_to_newline("PC connected: " + string(PCConnected) + " / " + string(_pcCount)));
if (_pcCount != 0 and PCConnected == _pcCount) {
    draw_text(220, 1045, string_hash_to_newline("Congratulations!"));
}


/*for (var ccX = 0; ccX < FWidth; ccX++) {
    for (var ccY = 0; ccY < FHeight; ccY++) {
        draw_text(ccX*100+70+20, ccY*100+150+25, ds_map_find_value(Field[ccX, ccY], "contentType"));
    }
}*/
/*for (var ccX = 0; ccX < FWidth; ccX++) {
    for (var ccY = 0; ccY < FHeight; ccY++) {
        draw_text(ccX*100+70+20, ccY*100+150+25, ds_map_find_value(Field[ccX, ccY], "searchIndex"));
    }
}


/* */
/*  */
