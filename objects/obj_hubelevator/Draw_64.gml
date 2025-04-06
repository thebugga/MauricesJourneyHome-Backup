if state != states.normal
{
	draw_set_font(global.font_small)
	var w = 0
	var h = 0
	var pad = 16
	var yy = 0
	for (var i = 0; i < array_length(hub_array); i++)
	{
		var txt = hub_array[i][2]
		if (string_width(txt) > w)
			w = string_width(txt)
		h += string_height(txt)
	}
	w += pad
	h += pad
	yy = (270 + (h / 2))
	draw_rectangle_color((480 - (w / 2)), (270 - (h / 2)), (480 + (w / 2)), yy, c_black, c_black, c_black, c_black, 0)
	yy -= (pad / 2)
	draw_set_valign(fa_bottom)
	draw_set_halign(fa_center)
	for (i = 0; i < array_length(hub_array); i++)
	{
		var c = (selected == i ? c_white : c_gray)
		txt = hub_array[i][2]
		draw_text_color(480, yy, txt, c, c, c, c, 1)
		yy -= string_height(txt)
	}
	if showinside
	{
		draw_set_color(c_black)
		draw_rectangle(0, 0, 10000, 10000, false)
		draw_set_color(c_white)
		draw_sprite(elavatorsprite, 0, irandom_range(-shake, shake), irandom_range(-shake, shake))
		shader_set(global.Pal_Shader)
		pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false)
		//pattern_set(global.Base_pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
		draw_sprite(charsprite, charindex, irandom_range(-shake, shake) , chary + irandom_range(-shake, shake))
		pattern_reset()
		reset_shader_fix()
	}
	draw_set_alpha(fadealpha)
	draw_set_color(c_black)
	draw_rectangle(0, 0, 10000, 10000, false)
	draw_set_alpha(1)
}