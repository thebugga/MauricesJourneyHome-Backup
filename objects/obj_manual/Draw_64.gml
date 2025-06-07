draw_set_font(global.creditsfont)
draw_set_valign(fa_middle)
draw_set_color(c_white)
if frame != sprite_get_number(spr_manual)
	draw_sprite(spr_manual, frame, 0, 0)
else
{
	for (var i = 0; i < array_length(totems); i++)
	{
		if i == 0
		{
			draw_set_halign(fa_center)
			draw_text(480, (totemy + 64), totems[i])
		}
		else
		{
			var spr = asset_get_index(concat("spr_pillar", i))
			if mouse_y < ((totemy + 128) + (128 * i)) && mouse_y > (totemy + (128 * i)) && mouse_x < 392 && mouse_x > 288
				spr = asset_get_index(concat("spr_pillar_scared", i))
			if (spr > -1)
			{
				totems[i][0] += 0.35
				if floor(totems[i][0]) >= (sprite_get_number(spr))
					totems[i][0] = 0
				draw_sprite(spr, totems[i][0], 340, ((totemy + 64) + (128 * i)))
			}
			draw_set_halign(fa_left)
			draw_text(460, ((totemy + 64) + (128 * i)), totems[i][1])
		}
		draw_sprite(spr_cursor, 0, mouse_x, mouse_y)
	}
}
if frame > 0
	draw_sprite_ext(spr_cursor, 0, 50 + irandom_range(-1, 1), 490, 1, 1, -45, c_white, 1)
if frame < sprite_get_number(spr_manual)
	draw_sprite_ext(spr_cursor, 0, 910 + irandom_range(-1, 1), 490, 1, 1, -225, c_white, 1)
if showlinks
{
	draw_set_halign(fa_left)
	draw_set_alpha(0.5)
	draw_set_color(c_black)
	draw_rectangle(0, 0, screen_w, screen_h, false)
	draw_set_alpha(1)
	draw_set_color(c_white)
	var linklength = array_length(links[frame][0])
	for (var i = 0; i < linklength; i++)
	{
		var starty = 270 - (((linklength - 1) * 75) / 2)
		draw_sprite(spr_goochlings, links[frame][0][i], 360, starty + (75 * i))
		draw_text(460, starty + (75 * i), links[frame][1][i])
	}
}