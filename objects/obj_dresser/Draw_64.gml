if up
{
	bg_place--
	draw_sprite_tiled_ext(spr_optionbg, 0, bg_place, bg_place / 2, 1, 1, c_white, 0.5)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(global.creditsfont)
	draw_text(480, 64, v_selectnames[v_select])
	shader_set(global.Pal_Shader)
	pal_swap_set(playerid.spr_palette, h_select[0] + 1, false)
	pattern_set(global.Base_Pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
	draw_sprite_ext(walk_sprite, walk_index, 480, 270, 4, 4, 0, c_white, 1)
	pattern_reset()
	reset_shader_fix()
	if h_select[1] != 0
		draw_sprite_ext(spr_mets, 0, 480, 230, 4, 4, 0, c_white, 1)
	switch v_select
	{
		case 0:
			var names = cloth_namesM
			if global.playerCharacter == Characters.Doise
				names = cloth_namesD
			draw_text(480, 440, names[h_select[0]])
			break
		case 1:
			draw_text(480, 440, hat_names[h_select[1]])
			break
	}
}
else
	bg_place = 0
	
draw_set_halign(fa_left)
draw_set_valign(fa_top)