function scr_player_rocketslide()
{
	hsp = (Xscale * Movespeed)
	Movespeed = approach(Movespeed, 0, 0.5)
	vsp = 0
	if (Movespeed <= 0)
	{
		state = states.rocket
		sprite_index = spr_rocket
		image_index = 0
		Movespeed = 8
		Xscale *= -1
	}
}
