if (surface_exists(bg_surface))
{
	surface_set_target(bg_surface)
	gpu_set_blendmode(bm_normal);
	draw_sprite_tiled(spr_checkerboard, 0, current_time / 60, current_time / 60);
	gpu_set_blendmode(bm_subtract)
	draw_sprite(sprite_index, 1, 0, 0)
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
}
else
	bg_surface = surface_create(sprite_width, sprite_height);
if (surface_exists(bg_surface))
	draw_surface(bg_surface, x, y);
draw_sprite(sprite_index, 0, x, y)