function scr_player_dynamite()
{
	if grounded
	{
		hsp = (Xscale * movespeed)
		if (movespeed > 0)
			movespeed -= 0.1
	}
	if grounded
		hsp = 0
	landAnim = 0
	if (animation_end() && sprite_index == spr_playerV_dynamitethrow)
	{
		if (key_attack && hsp != 0)
			state = states.mach2
		else
			state = states.normal
	}
	image_speed = 0.4
	exit;
}

