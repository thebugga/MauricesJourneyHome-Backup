function draw_player()
{
	var b = get_dark(image_blend, other.use_dark);
	var ps = paletteselect;
	var spr = spr_palette;
	shader_set(global.Pal_Shader);
	pal_swap_set(spr_mauricepalette, 0);
	draw_sprite_ext(sprite_index, image_index, x, y, xscale * scale_xs, yscale * scale_ys, angle, b, image_alpha);
}
function draw_enemy(healthbar, palette, color = c_white)
{
		var b = get_dark(image_blend, obj_drawcontroller.use_dark);
		var _stun = 0;
	    var _ys = 1;
		draw_sprite_ext(sprite_index, image_index, x, y + _stun, 1 * image_xscale, 1 * _ys, 0, b, image_alpha);
		if healthbar
		{
			if hp > maxhp
				maxhp = hp;
			draw_healthbar(x - 16, y - 50, x + 16, y - 45, (hp / maxhp) * 100, 0, 255, 255, 0, true, true);
		}
}
function get_dark(blend, use_dark, use_position = false, posX = 0, posY = 0)
{
	if use_dark
	{
		if room == boss_vigilante
			blend = make_color_rgb(247, 109, 22);
		var d = room_width * room_height;
		var b = d;
		var bb = b;
		with obj_lightsource
		{
			if (object_index != obj_lightsource_attach || instance_exists(objectID))
			{
				if !use_position
					var dis = distance_to_object(other);
				else
					dis = distance_between_points(x, y, posX, posY);
				if dis < d
				{
					bb = dis / distance;
					if bb < b
					{
						b = bb;
						d = dis;
					}
				}
			}
		}
		var t = (b + 0.4) * 255;
		var a = (1 - obj_drawcontroller.dark_alpha) * 255;
		a -= 102;
		t = clamp(t, 0, 255);
		a = clamp(a, 0, 255);
		var r = (color_get_red(blend) - t) + a;
		var g = (color_get_green(blend) - t) + a;
		b = (color_get_blue(blend) - t) + a;
		if r < 0
			r = 0;
		if g < 0
			g = 0;
		if b < 0
			b = 0;
		return make_color_rgb(r, g, b);
	}
	else
		return image_blend;
}