if (instance_exists(obj_option))
	exit;
reset_blendmode()
reset_shader_fix()
draw_set_alpha(1)
if pause
{
	draw_rectangle(0, 0, 960, 540, false)
	if (appsprite != -4)
		draw_sprite(appsprite, 0, 0, 0)
	if (guisprite != -4)
		draw_sprite(guisprite, 0, 0, 0)
	draw_set_alpha(0.5)
	draw_rectangle_color(0, 0, 960, 540, c_maroon, c_maroon, c_maroon, c_maroon, false)
	draw_set_alpha(1)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_font(global.bigfont)
	draw_sprite_ext(spr_title, 0, 480, 50, 0.5, 0.5, 0, c_white, 1)
	for (var i = 0; i < array_length(pause_menu); i++)
	{
		var c = c_gray
		var yy = (240 + (48 * i))
		if (selected == i)
		{
			c = 16777215
			draw_sprite(spr_cursor, cursor_index, (480 - (string_width(pause_menu[i][0]) / 2) - 48), yy)
		}
		draw_text_color(480, yy, pause_menu[i][0], c, c, c, c, 1)
	}
	//shader_set(global.Pal_Shader)
	//pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false)
	//pattern_set(global.Base_Pattern_Color, pause_menu[selected][1], peppino_index, 1, 1, global.patterntexture)
	draw_sprite(peppino_sprite, peppino_index, 240, 270)
	//pattern_reset()
	//reset_shader_fix()
}
