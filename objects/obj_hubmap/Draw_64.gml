var _map_surface = surface_create(sprite_width, sprite_height)

surface_set_target(_map_surface)
draw_clear(c_white)

for (var p = 0; p < array_length(map_array); p++)
{
	if map_array[p][0] == room
	{
		draw_sprite(spr_hubmap_plots, 0, (sprite_width / 2) - map_array[p][1], (sprite_height / 2) - map_array[p][2])
		draw_sprite(spr_hubmap_heads, 0, sprite_width / 2, sprite_height / 2)
	}
		
}

gpu_set_blendmode(bm_subtract)
draw_sprite(sprite_index, 1, 0, 0)
gpu_set_blendmode(bm_normal)

surface_reset_target()

draw_surface(_map_surface, SCREEN_WIDTH - sprite_width, SCREEN_HEIGHT - y)
draw_sprite(sprite_index, 0, SCREEN_WIDTH - sprite_width, SCREEN_HEIGHT - y)

surface_free(_map_surface)