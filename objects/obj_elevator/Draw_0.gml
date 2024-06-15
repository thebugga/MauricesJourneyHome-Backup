draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
shader_reset()
if brownfade < 1
{
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha)
shader_reset()
}
if brown
{
	draw_set_alpha(brownfade);
	shader_set(shd_rank);
	draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, false);
	draw_self();
	shader_reset();
	draw_set_alpha(1);
}