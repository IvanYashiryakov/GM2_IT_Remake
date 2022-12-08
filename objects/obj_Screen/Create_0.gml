
room_width=window_get_width()
room_height=window_get_height()
__view_set( e__VW.WView, 0, room_width )
__view_set( e__VW.HView, 0, room_height )
__view_set( e__VW.WPort, 0, display_get_width( ))
__view_set( e__VW.HPort, 0, display_get_height( ))
surface_resize(application_surface,room_width,room_height)


