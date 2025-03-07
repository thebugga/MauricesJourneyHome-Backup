function scr_player_freefallprep()
{
	move = (key_left + key_right)
	if (!grounded)
	{
		hsp = (move * movespeed)
		if (move != Xscale && momemtum == 1 && movespeed != 0)
			movespeed -= 0.05
		if (movespeed == 0)
			momemtum = 0
		if ((move == 0 && momemtum == 0) or place_meeting_solid((x + hsp), y))
		{
			movespeed = 0
			mach2 = 0
		}
		if (move != 0 && movespeed < 7)
			movespeed += 0.25
		if (movespeed > 7)
			movespeed -= 0.05
		if ((place_meeting_solid((x + 1), y) && move == 1) or (place_meeting_solid((x - 1), y) && move == -1))
			movespeed = 0
		if (dir != Xscale)
		{
			mach2 = 0
			dir = Xscale
			movespeed = 0
		}
		if (move == (-Xscale))
		{
			mach2 = 0
			movespeed = 0
			momemtum = 0
		}
		if (move != 0)
			Xscale = move
		if (vsp > 0)
			vsp = 0
	}
	image_speed = 0.5
	if (animation_end())
	{
		state = states.freefall
		if (shotgunAnim == 0)
			sprite_index = spr_bodyslamfall
		else
			sprite_index = spr_shotgunjump3
	}
	exit;
}

