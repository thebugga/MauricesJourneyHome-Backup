shader_set(global.Pal_Shader)
if (global.collect >= global.collectN)
	pal_swap_set(obj_player1.spr_palette, obj_player1.paletteselect, false)
if (global.collectN > global.collect)
	pal_swap_set(obj_player2.spr_palette, obj_player2.paletteselect, false)
pattern_set(global.Base_pattern_Color, sprite_index, image_index, image_xscale, image_yscale, global.palettetexture);
draw_self()
pattern_reset()
shader_reset()
draw_set_font(global.smallfont)
draw_set_halign(fa_left)
draw_set_valign(fa_bottom)
for (var i = 0; i < array_length(minitext); i++)
{
	var b = minitext[i]
	if (b[0])
		draw_text_color(10, 530 - (16 * i), b[1], c_white, c_white, c_white, c_white, 1)
}