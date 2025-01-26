if up
{
	bg_place--
	draw_sprite_tiled_ext(spr_optionbg, 0, bg_place, bg_place / 2, 1, 1, c_white, 0.5)
	shader_set(global.Pal_Shader)
	pal_swap_set(playerid.spr_palette, selected, false)
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.patterntexture)
	draw_sprite_ext(walk_sprite, walk_index, 480, 270, 4, 4, 0, c_white, 1)
	pattern_reset()
	reset_shader_fix()
}
else
	bg_place = 0