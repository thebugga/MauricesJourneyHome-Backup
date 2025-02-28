function scr_player_fireass()
{
	image_speed = 0.35
	alarm[5] = 2
	alarm[7] = 60
	with (instance_place(x, (y + vsp), obj_ratblock))
		instance_destroy()
	if place_meeting((x + hsp), y, obj_solid)
		image_xscale *= -1
	if (sprite_index == spr_fireass or sprite_index == spr_scaredjump1 or sprite_index == spr_scaredjump2)
	{
		if (floor(image_index) == (image_number - 1) && sprite_index == spr_fireass)
			create_particle(x, (y + 25), states.ejected, 0)
		Move = (key_left + key_right)
		hsp = Movespeed
		if (Move != 0)
		{
			if (Move == Xscale)
				Movespeed = approach(Movespeed, (Xscale * 8), 0.5)
			else
				Movespeed = approach(Movespeed, 0, 0.5)
			if (Movespeed <= 0)
				Xscale = Move
		}
		else
			Movespeed = approach(Movespeed, 0, 0.1)
		if place_meeting(x, (y + 1), obj_haystack)
			vsp = -20
		else if (grounded && vsp > 0 && (!(place_meeting(x, (y + 1), obj_ratblock))))
		{
			Movespeed = 6
			if (sprite_index == spr_fireass)
				sprite_index = spr_fireassground
			else
			{
				Movespeed = 0
				landAnim = 0
				alarm[5] = 2
				alarm[7] = 60
				hurted = 1
				state = states.normal
				sprite_index = spr_idle
				image_index = 0
			}
			image_index = 0
		}
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_scaredjump1)
		sprite_index = spr_scaredjump2
	if (sprite_index == spr_fireassground)
	{
		hsp = (Xscale * Movespeed)
		if (Movespeed > 0)
			Movespeed -= 0.25
		if (floor(image_index) == (image_number - 1))
		{
			Movespeed = 0
			landAnim = 0
			alarm[5] = 2
			alarm[7] = 60
			hurted = 1
			state = states.normal
			sprite_index = spr_idle
			image_index = 0
		}
	}
	if (sprite_index == spr_fireassend)
	{
		if (floor(image_index) == (image_number - 1))
		{
			Movespeed = 0
			landAnim = 0
			alarm[5] = 2
			alarm[7] = 60
			hurted = 1
			state = states.normal
			sprite_index = spr_idle
			image_index = 0
		}
	}
	exit;
}

