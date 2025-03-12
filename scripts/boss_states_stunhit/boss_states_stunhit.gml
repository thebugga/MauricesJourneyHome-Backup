function state_boss_stun()
{
	image_speed = 0
	if sprite_index == spr_hit
	{
		hsp = approach(hsp, 0, 0.25)
		if hsp == 0
		{
			sprite_index = spr_idle
			state = states.normal
		}
	}
	else if sprite_index == spr_flung
	{
		hsp = movespeed * image_xscale
		if ((grounded || (grounded && (!(place_meeting(x, y, obj_platform))))) && vsp > 0)
		{
			movespeed = approach(movespeed, 0, 0.25)
			funnyangle = 0
			if image_index == 0
			{
				image_index = 1
				grav = 0.5
				bouncetimes--
				if bouncetimes > 0
				{
					image_index = 1
					stunnedbuffer = 5
				}
				else
				{
					image_index = 2
					stunnedbuffer = 25
				}
			}
			else
			{
				if (stunnedbuffer > 0)
					stunnedbuffer--
				else
				{
					if bouncetimes > 0
						vsp = -5 * bouncetimes
					else
					{
						bouncetimes = 3
						sprite_index = spr_idle
						state = states.normal
					}
				}
			}
		}
		else
		{
			image_index = 0
			funnyangle = point_direction(0, 0, hsp, vsp)
			if image_xscale == 1
				funnyangle += 180
		}
		if place_meeting(x, (y + 1), obj_railh)
			hsp = -5
		else if place_meeting(x, (y + 1), obj_railh2)
			hsp = 5
	}
	exit;
}
