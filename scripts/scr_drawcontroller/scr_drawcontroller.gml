function get_dark(argument0, argument1)
{
	if argument1
	{
		var d = (room_width * room_height)
		var b = d
		var bb = b
		with (obj_lightsource)
		{
			var dis = distance_to_object(other)
			if (distance_to_object(other) < d)
			{
				bb = (dis / distance)
				if (bb < b)
				{
					b = bb
					d = dis
				}
			}
		}
		var t = ((b + 0.4) * 255)
		t = clamp(t, 0, 255)
		return make_color_rgb((color_get_red(argument0) - t), (color_get_green(argument0) - t), (color_get_blue(argument0) - t));
	}
	else
		return image_blend;
}
function enemy_is_superslam(baddieid)
{
	with baddieid
	{
		if state == states.grabbed
		{
			var g = grabbedby == 1 ? obj_player1.id : obj_player2.id;
			if g.state == states.superslam || (g.state == states.chainsaw && g.tauntstoredstate == states.superslam)
				return true;
		}
	}
	return false;
}
function draw_enemy(_kungfu, usepalette)
{
	var _stun = 0
	if (state == states.stun && thrown == false)
		_stun = 25
	if (visible && object_index != obj_pizzaball && bbox_in_camera(view_camera[0], 32))
	{
		var c = image_blend
		if elite
			c = 65535
		if elitegrab
			c = 32768
		b = get_dark(c, obj_drawcontroller.use_dark)
		if (object_index == obj_peppinoclone)
		{
			shader_set(global.Pal_Shader)
			pal_swap_set(spr_peppalette, 1, 0)
		}
		else
		{
			shader_set(global.Pal_Shader)
			pal_swap_set(spr_palette, paletteselect, 0)
		}
		var _ys = 1
		if state == states.grabbed
		{
			if (enemy_is_superslam(id))
			{
				_stun += 18
				_ys = -1
			}
		}
		draw_sprite_ext(sprite_index, image_index, x, (y + _stun), (Xscale * image_xscale), Yscale * _ys, Rotation, b, image_alpha)
		if _kungfu
		{
			if (hp > maxhp)
				maxhp = hp
			draw_healthbar((x - 16), (y - 50), (x + 16), (y - 45), ((hp / maxhp) * 100), c_black, c_red, c_red, 0, 1, 1)
		}
		if (object_index == obj_peppinoclone or usepalette)
			shader_reset()
	}
}
function draw_superslam_enemy()
{
	if (state == states.superslam && floor(image_index) >= 5 && floor(image_index) <= 7 && instance_exists(baddiegrabbedID))
	{
		with baddiegrabbedID
			draw_enemy(global.kungfu, true);
	}
}

function draw_player()
{
	var b = get_dark(image_blend, other.use_dark);
	var pattern = global.palettetexture;
	var ps = paletteselect;
	var spr = spr_palette;
    if global.playerCharacter == Characters.Pierre
        spr = spr_pierrepalette
	if object_index == obj_player1
		pattern_set(global.Base_Pattern_Color, sprite_index, image_index, Xscale * scale_xs, Yscale * scale_ys, pattern);
	pal_swap_set(spr, ps, false);
	draw_sprite_ext(sprite_index, image_index, x, y, Xscale * scale_xs, Yscale * scale_ys, Rotation, b, image_alpha);
	draw_superslam_enemy();
	pattern_reset();
}