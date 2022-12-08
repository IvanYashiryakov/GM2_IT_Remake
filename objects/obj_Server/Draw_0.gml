
draw_set_font(debugFont);
//draw_set_valign(fa_middle);
//draw_set_halign(fa_center);
/*
draw_text(x-35, y+25, w[LEFT]);
draw_text(x+25, y-84, w[UP]);
draw_text(x+34, y+25, w[RIGHT]);
draw_text(x+25, y+85, w[DOWN]);
*/
draw_text(x+25, y-84, string_hash_to_newline(portsCount));
if (w[LEFT]) {
    draw_sprite_ext(spr_Server_wires, 0, x, y, 1, 1, 0, c_white, 1);
}
if (w[UP]) {
    draw_sprite_ext(spr_Server_wires, 1, x, y, 1, 1, 0, c_white, 1);
}
if (w[RIGHT]) {
    draw_sprite_ext(spr_Server_wires, 2, x, y, 1, 1, 0, c_white, 1);
}
if (w[DOWN]) {
    draw_sprite_ext(spr_Server_wires, 3, x, y, 1, 1, 0, c_white, 1);
}
draw_self();

/* */
/*  */
