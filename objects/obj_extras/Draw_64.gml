draw_clear_alpha(c_red, 0.5)
if !instance_exists(obj_manual)
{
	draw_set_font(global.bigfont)
	draw_set_halign(fa_center)
	draw_set_valign(fa_top)
	for (var i = 0; i < array_length(selectmap); i++)
	{
		draw_set_color(c_gray)
		if (selected == i)
			draw_set_color(c_white)
		draw_text(480, 200 + (48 * i), selectmap[i])
	}
}