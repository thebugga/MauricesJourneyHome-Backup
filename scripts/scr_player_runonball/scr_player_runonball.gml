function scr_player_runonball()
{
	Move = (key_left + key_right)
	if (!key_attack)
		hsp = (Move * Movespeed)
	else
		hsp = (image_xscale * Movespeed)
	jumpstop = 0
	vsp = obj_parent_player.vsp
	sprite_index = spr_player_slipnslide
	if (key_attack && grounded)
	{
		if (mach2 < 35)
		{
			mach2++
			Movespeed = 4
		}
		if (mach2 >= 35)
			Movespeed = 6
	}
	if (!key_attack)
		mach2 = 0
	image_speed = 0.35
}
