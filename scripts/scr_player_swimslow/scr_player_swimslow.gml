function scr_player_swimslow()
{
	Xscale = 1
	move_h = (key_right + key_left)
	move_v = (key_down - key_up)
	if sprite_index != spr_player_supersidejumpland && sprite_index != spr_player_supersidejumpprep
	{
		image_speed = 0.35
		if input_buffer_slap > 0
		{
			sprite_index = spr_player_dashpad
			image_index = 0
			input_buffer_slap = 0
			movespeed = min(movespeed + 7, 15)
		}
		movespeed = approach(movespeed, key_slap * 5, 0.5)
		if move_h != 0 || move_v != 0
		{
			var _diff = angle_difference(sjumpangle, point_direction(0, 0, move_h, move_v))
			sjumpangle -= clamp(_diff, -10, 10)
		}
		if key_attack
		{
			sprite_index = spr_player_supersidejumpprep
			image_index = 0
		}
	}
	else
		movespeed = approach(movespeed, 0, 0.25)
	if animation_end()
	{
		if sprite_index == spr_player_supersidejumpland || sprite_index == spr_player_dashpad
			sprite_index = spr_player_slipnslide
		if sprite_index == spr_player_supersidejumpprep
		{
			instance_create(x, y, obj_parryeffect)
			movespeed = 15
			state = states.mach1
			if move_h != 0 || move_v != 0
				sjumpangle = point_direction(0, 0, move_h, move_v)
		}
	}	
	hsp = lengthdir_x(movespeed, sjumpangle)
	vsp = lengthdir_y(movespeed, sjumpangle)
	if hsp != 0
		Yscale = sign(hsp)
	Rotation = point_direction(0, 0, hsp, vsp)
	if !place_meeting(x, y, obj_water)
	{
		Xscale = Yscale
		Rotation = 0
		movespeed = abs(hsp)
		state = states.mach2
		jumpstop = true
		sprite_index = spr_jump2
		image_index = 0
		with (instance_create(x, y, obj_parryeffect))
			sprite_index = spr_watereffect
	}
}
