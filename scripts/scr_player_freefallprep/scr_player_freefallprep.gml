function scr_player_freefallprep()
{
	Move = (key_left + key_right)
	if (!grounded)
	{
		hsp = (Move * Movespeed)
		if (Move != Xscale && momemtum == 1 && Movespeed != 0)
			Movespeed -= 0.05
		if (Movespeed == 0)
			momemtum = 0
		if ((Move == 0 && momemtum == 0) or place_meeting_solid((x + hsp), y))
		{
			Movespeed = 0
			mach2 = 0
		}
		if (Move != 0 && Movespeed < 7)
			Movespeed += 0.25
		if (Movespeed > 7)
			Movespeed -= 0.05
		if ((place_meeting_solid((x + 1), y) && Move == 1) or (place_meeting_solid((x - 1), y) && Move == -1))
			Movespeed = 0
		if (dir != Xscale)
		{
			mach2 = 0
			dir = Xscale
			Movespeed = 0
		}
		if (Move == (-Xscale))
		{
			mach2 = 0
			Movespeed = 0
			momemtum = 0
		}
		if (Move != 0)
			Xscale = Move
		if (vsp > 0)
			vsp = 0
	}
	image_speed = 0.5
	if (floor(image_index) == (image_number - 1))
	{
		state = states.freefall
		if (shotgunAnim == 0)
			sprite_index = spr_bodyslamfall
		else
			sprite_index = spr_shotgunjump3
	}
	exit;
}

