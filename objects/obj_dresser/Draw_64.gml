if up
{
	bg_place--
	draw_sprite_tiled_ext(bg_letterbox, 0, bg_place, bg_place / 2, 1, 1, c_white, 0.5)
	draw_set_align(fa_center, fa_middle, c_white)
	draw_set_font(global.creditsfont)
	draw_text(480, 64, v_selectnames[v_select])
	
	pattern_draw(walk_sprite, walk_index, 480, 270, clothes_arr[h_select[0]].pattern, 4, 4)

	pal_swap_set(obj_player.spr_palette, clothes_arr[h_select[0]].pal_ix, false)
	if walk_sprite == obj_player.spr_taunt
		draw_sprite_ext(spr_taunteffect, taunt_index, 480, 270, 3, 3, 0, c_white, 1)
		draw_sprite_ext(walk_sprite, walk_index, 480, 270, 4, 4, 0, c_white, 1)
	pal_swap_reset()
	if h_select[1] != 0
		draw_sprite_ext(hats_arr[h_select[1]][1], 0, 480, 230, 4, 4, 0, c_white, 1)
	switch v_select
	{
		case 0:
			draw_text(480, 440, clothes_arr[h_select[0]].name)
			draw_set_font(global.smallerfont)
			draw_text(480, 480, clothes_arr[h_select[0]].description)
			break
		case 1:
			draw_text(480, 440, hats_arr[h_select[1]][0])
			break
	}
}
else
	bg_place = 0
	
draw_set_halign(fa_left)
draw_set_valign(fa_top)