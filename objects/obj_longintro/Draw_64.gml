if showtext
{
	font_add_sprite_ext(spr_truefont,"ABCDEFGHIJKLMNÑOPQRSTUVWXYZabcdefghijklmnñopqrstuvwxyz!.1234567890:()?[]&", 1, 0)
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	global.tdp_text_try_outline = true;
	draw_text(16, 540 - 48, text);
	global.tdp_text_try_outline = false;
}
