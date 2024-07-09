draw_sprite(spr_manual, frame, 0, 0)
if frame > 0
	draw_sprite_ext(spr_uparrow, 0, 50 + irandom_range(-1, 1), 490, 1, 1, 90, c_white, 1)
if frame < sprite_get_number(spr_manual) - 1
	draw_sprite_ext(spr_uparrow, 0, 910 + irandom_range(-1, 1), 490, 1, 1, -90, c_white, 1)
if showlinks
{
	draw_set_font(global.creditsfont)
	draw_set_halign(fa_left)
	draw_set_valign(fa_middle)
	draw_set_alpha(0.5)
	draw_set_color(c_black)
	draw_rectangle(0, 0, 960, 540, false)
	draw_set_alpha(1)
	draw_set_color(c_white)
	var linklength = array_length(links[frame][0])
	for (var i = 0; i < linklength; i++)
	{
		var starty = 270 - (((linklength - 1) * 75) / 2)
		draw_sprite(spr_manualicon, links[frame][0][i], 360, starty + (75 * i))
		draw_text(460, starty + (75 * i), links[frame][1][i])
	}
}