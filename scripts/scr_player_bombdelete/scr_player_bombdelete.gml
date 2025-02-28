function scr_player_bombdelete()
{
	image_speed = 0.35
	hsp = (Move * Movespeed)
	sprite_index = spr_bombpeprun
	Move = (key_left + key_right)
	if (dir != Xscale)
	{
		dir = Xscale
		Movespeed = 2
	}
	if (Move != 0)
	{
		Xscale = Move
		if (Movespeed < 5)
			Movespeed += 0.5
		else if (floor(Movespeed) == 5)
			Movespeed = 5
	}
	else
		Movespeed = 0
	if (Movespeed > 5)
		Movespeed -= 0.1
	if key_slap2
	{
		state = states.normal
		with (instance_create(x, y, obj_bomb))
		{
			hsp = (other.Xscale * 10)
			vsp = -8
		}
	}
	exit;
}

