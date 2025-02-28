function scr_player_noisejetpack()
{
	hsp = (xscale * Movespeed)
	Move = (key_left + key_right)
	if (key_jump2 && jetpackfuel > 0)
	{
		jetpackfuel--
		vsp = -6
		sprite_index = spr_playerN_doublejump
	}
	else
		sprite_index = spr_playerN_doublejumpfall
	if (Move != 0)
	{
		if (xscale != Move)
		{
			Movespeed = approach(Movespeed, 0, 0.5)
			if (Movespeed <= 0)
			{
				Movespeed = 0
				xscale = Move
			}
		}
		else if (Movespeed < 8)
			Movespeed = approach(Movespeed, 8, 0.5)
	}
	if (place_meeting((x + sign(hsp)), y, obj_solid) or place_meeting_slope((x + sign(hsp)), y))
	{
		Movespeed = 4
		xscale *= -1
	}
	if key_down2
	{
		sprite_index = spr_bodyslamstart
		image_index = 0
		state = states.freefallprep
		vsp = (global.playerCharacter == Characters.Maurice ? -5 : -7)
	}
	if (grounded && vsp > 0)
	{
		state = states.normal
		if (Movespeed >= 12)
		{
			state = states.mach3
			sprite_index = spr_dashpadmach
			image_index = 0
		}
	}
}
