function scr_player_rideweenie()
{
	hsp = Movespeed
	Move = (key_right + key_left)
	if (Move != 0)
	{
		if (Move == Xscale)
			Movespeed = approach(Movespeed, (Xscale * 16), 0.35)
		else
		{
			Movespeed = approach(Movespeed, 0, 0.7)
			if (Movespeed <= 0)
				Xscale = Move
		}
		if (abs(Movespeed) < 3 && Move != 0)
			image_speed = 0.35
		else if (abs(Movespeed) > 3 && abs(Movespeed) < 6)
			image_speed = 0.45
		else
			image_speed = 0.6
	}
	else
		Movespeed = approach(Movespeed, 0, 0.7)
	if (grounded && (!(place_meeting(x, (y + 1), obj_bounceplank))))
	{
		if (!(place_meeting(x, (y + 1), obj_slope)))
			instance_create(x, y, obj_highjumpcloud2)
		vsp = -6
	}
	if key_jump
		input_buffer_jump = 0
	if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))) && (!(place_meeting((x + hsp), y, obj_ratblock))) && (!(place_meeting((x + hsp), y, obj_destructibles))))
	{
		Movespeed = ((-Movespeed) * 0.5)
		repeat (3)
		{
			with (create_debris(x, y, spr_slapstar))
			{
				hsp = random_range(-5, 5)
				vsp = random_range(-10, 10)
			}
		}
	}
	if key_jump
	{
		Movespeed = abs(hsp)
		if (Movespeed < 6)
			Movespeed = 6
		dir = Xscale
		state = states.mach2
		sprite_index = spr_mach2jump
		jumpstop = 0
		vsp = -11
		instance_create(x, y, obj_jumpdust)
		with (instance_create(x, y, obj_weeniemount))
			image_xscale = other.Xscale
	}
	if ((!instance_exists(dashcloudid)) && grounded)
	{
		with (instance_create(x, y, obj_dashcloud))
		{
			image_xscale = other.Xscale
			other.dashcloudid = id
		}
	}
	if (punch_afterimage > 0)
		punch_afterimage--
	else
	{
		punch_afterimage = 5
		create_mach3effect(x, y, sprite_index, image_index, Xscale)
	}
	image_speed = 0.5
	exit;
}

