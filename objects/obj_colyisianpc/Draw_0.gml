surfacedropshadow = surface_create(room_width, room_height);
surface_set_target(surfacedropshadow)
draw_clear_alpha(c_white,0)
draw_self();
surface_reset_target()
draw_surface_ext(surfacedropshadow,8,4,1,1,0,c_black,0.5)
surface_free(surfacedropshadow)
draw_self();
