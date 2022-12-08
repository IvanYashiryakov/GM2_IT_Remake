//surface_reset_target();
draw_texture_flush();

if (instance_number(obj_Game_02) == 0)
    instance_create(140, 130, obj_Game_02);
instance_create(100, 50, obj_btn_Difficulty);
instance_create(280, 50, obj_btn_Restart);
instance_create(415, 50, obj_btn_Random);
instance_create(500, 50, obj_btn_LineUp);
instance_create(585, 50, obj_btn_DeleteExtra);
instance_create(100, 1050, obj_btn_BackToMenu);
instance_create(550, 950, obj_btn_ON);