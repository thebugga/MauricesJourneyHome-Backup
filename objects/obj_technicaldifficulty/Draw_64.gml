draw_sprite(spr_technicaldifficulty_bg, 0, x, 0)
if sprite != -4
{
	shader_set(global.retro_pal_swapper)
	pal_swap_set(playerid.spr_palette, playerid.paletteselect, false)
	////pattern_setup(global.patterntexture, [1,2], sprite_index, image_index, 1, 1, 1, 1);
	draw_sprite(sprite, frame, x, 0)
	//pattern_reset()
	reset_shader_fix()
}