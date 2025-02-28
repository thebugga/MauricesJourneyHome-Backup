function scr_player_pummel()
{
	image_speed = 0.35
	if (Movespeed > 0)
		Movespeed -= 1
	if (Movespeed <= 0)
		Movespeed = 0
	hsp = (Xscale * Movespeed)
	if (sprite_index != spr_grab)
	{
		if (floor(image_index) == (image_number - 1))
		{
			sprite_index = spr_grab
			image_index = 0
		}
	}
	exit;
}

