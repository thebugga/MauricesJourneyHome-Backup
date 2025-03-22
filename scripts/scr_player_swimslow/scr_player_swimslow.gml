function scr_player_swimslow()
{
	if (live_call()) return live_result;
	move_h = (key_right + key_left)
	move_v = (key_down - key_up)
	if sprite_index != spr_player_supersidejumpland && sprite_index != spr_player_supersidejumpprep
	{
		movespeed = approach(movespeed, (move_h != 0 || move_v != 0) * 5, 1)
		if move_h != 0 || move_v != 0
		{
			var _diff = angle_difference(sjumpangle, point_direction(0, 0, move_h, move_v))
			sjumpangle -= _diff / 2
		}
		sprite_index = spr_player_slipnslide
		image_speed = 0.35
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
		if sprite_index == spr_player_supersidejumpland
			sprite_index = spr_idle
		if sprite_index == spr_player_supersidejumpprep
		{
			movespeed = 12
			state = states.mach1
			if move_h != 0 || move_v != 0
				sjumpangle = point_direction(0, 0, move_h, move_v)
		}
	}	
	hsp = lengthdir_x(movespeed, sjumpangle)
	vsp = lengthdir_y(movespeed, sjumpangle)
	if hsp != 0
	{
		Xscale = sign(hsp)
		Yscale = sign(hsp)
	}
	Rotation = point_direction(0, 0, hsp, vsp)
	if !place_meeting(x, y, obj_water)
	{
		Yscale = 1
		Rotation = 0
		movespeed = abs(hsp)
		state = states.jump
		vsp = -8
		jumpstop = true
		sprite_index = spr_jump2
		image_index = 0
		with (instance_create(x, y, obj_parryeffect))
			sprite_index = spr_watereffect
	}
}
