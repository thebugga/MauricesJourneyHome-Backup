depth = -10
for (var p = 0; p < array_length(particle_list); p++) 
{
	var p_id = particle_list[p]
	with p_id
	{
		if sprite_index != noone && sprite_index != -1
			draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
	}
}