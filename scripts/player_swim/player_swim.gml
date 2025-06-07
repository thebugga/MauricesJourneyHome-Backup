function player_swim()
{
	xscale = 1
	var move_h = (key_right.down - key_left.down)
	var move_v = (key_down.down - key_up.down)
	if sprite_index == spr_mach3
	{
		if move_h != 0 || move_v != 0
		{
			var _diff = angle_difference(sjumpangle, point_direction(0, 0, move_h, move_v))
			sjumpangle -= clamp(_diff, -10, 10)
		}
		if scr_hitwall(x + hsp, y)
		{
			reset_anim(spr_mach3hitwall)
			hsp *= -1
			vsp *= -1
		}
		if !key_dash.down
			reset_anim(spr_player_slipnslide)
	}
	else
	{
		if sprite_index != spr_mach3hitwall && sprite_index != spr_mach3kill
		{
			image_speed = 0.35
			if input_buffers.grab > 0
			{
				reset_anim(spr_player_dashpad)
				input_buffers.grab = 0
				movespeed = min(movespeed + 7, 15)
			}
			movespeed = approach(movespeed, key_grab.down * 5, 0.5)
			if move_h != 0 || move_v != 0
			{
				var _diff = angle_difference(sjumpangle, point_direction(0, 0, move_h, move_v))
				sjumpangle -= clamp(_diff, -10, 10)
			}
			if key_dash.pressed
			{
				sprite_index = spr_mach3kill
				image_index = 0
			}
		}
		else
			movespeed = approach(movespeed, 0, 0.25)
		if anim_ended()
		{
			if sprite_index == spr_mach3hitwall || sprite_index == spr_player_dashpad
				sprite_index = spr_player_slipnslide
			if sprite_index == spr_mach3kill
			{
				movespeed = 15
				reset_anim(spr_mach3)
				if move_h != 0 || move_v != 0
					sjumpangle = point_direction(0, 0, move_h, move_v)
			}
		}
	}
	hsp = lengthdir_x(movespeed, sjumpangle)
	vsp = lengthdir_y(movespeed, sjumpangle)
	if hsp != 0
		yscale = sign(hsp)
	rotation = point_direction(0, 0, hsp, vsp)
	if !place_meeting(x, y, obj_water)
	{
		xscale = yscale
		rotation = 0
		movespeed = abs(hsp)
		state = states.mach2
		jumpstop = true
		reset_anim(spr_mach2jump)
	}
}