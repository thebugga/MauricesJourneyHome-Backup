function scr_player_stringjump()
{
	hsp = (Xscale * Movespeed)
	Move = (key_left + key_right)
	if (Move != 0)
	{
		if (Xscale != Move)
		{
			if (Movespeed > 0)
				Movespeed = approach(Movespeed, 0, 0.5)
			else
			{
				Xscale = Move
				Movespeed = 0
			}
		}
		else if (Movespeed < 8)
			Movespeed = approach(Movespeed, 8, 0.25)
	}
	if place_meeting((x + sign(hsp)), y, obj_solid)
		Movespeed = 0
	if (grounded && vsp > 0)
	{
		state = states.normal
		landAnim = 1
		sprite_index = spr_land
		create_particle(x, y, particle.landcloud, 0)
	}
}

function scr_player_stringfall()
{
	if instance_exists(stringid)
	{
		sprite_index = spr_player_mrpinch
		hsp = Movespeed
		Move = (key_left + key_right)
		if (Move == 0)
			Movespeed = approach(Movespeed, 0, 0.1)
		else
			Movespeed = approach(Movespeed, (Move * 4), 0.25)
		if (abs(Movespeed) > 14)
			Movespeed = approach(Movespeed, 0, 0.5)
	}
	hsp = Movespeed
}
