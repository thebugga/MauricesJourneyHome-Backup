draw_sprite(spr_technicaldifficulty_bg, 0, x, 0)
if sprite != -4
{
	shader_set(global.Pal_Shader)
	pal_swap_set(playerid.spr_palette, playerid.paletteselect, false)
	//pattern_set(global.Base_pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	draw_sprite(sprite, frame, x, 0)
	pattern_reset()
	reset_shader_fix()
}