function scr_player_mach1()
{
	if (live_call()) return live_result;
	sprite_index = spr_player_supersidejump
	move_h = (key_right + key_left)
	move_v = (key_down - key_up)
	if move_h != 0 || move_v != 0
	{
		var _diff = sign(angle_difference(sjumpangle, point_direction(0, 0, move_h, move_v)))
		sjumpangle -= _diff * 10
	}
	hsp = lengthdir_x(movespeed, sjumpangle)
	vsp = lengthdir_y(movespeed, sjumpangle)
	if hsp != 0
	{
		Xscale = sign(hsp)
		Yscale = sign(hsp)
	}
	Rotation = point_direction(0, 0, hsp, vsp)
	if ((place_meeting(x + hsp, y, obj_solid) || place_meeting_slope(x + hsp, y)) && !place_meeting(x + hsp, y, obj_destructibles)) || (grounded && vsp > 0) || (place_meeting_solid(x, y - 1) && !place_meeting(x, y - 1, obj_destructibles))
	{
		sprite_index = spr_player_supersidejumpland
		hsp *= -1
		vsp *= -1
		state = states.swimslow
	}
	if !key_attack
		state = states.swimslow
	if !place_meeting(x, y, obj_water)
	{
		Yscale = 1
		Rotation = 0
		movespeed = abs(hsp)
		state = states.mach2
		jumpstop = true
		sprite_index = spr_secondjump1
		image_index = 0
		with (instance_create(x, y, obj_parryeffect))
			sprite_index = spr_watereffect
	}
}

