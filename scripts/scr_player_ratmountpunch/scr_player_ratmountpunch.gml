function scr_player_ratmountpunch()
{
	image_speed = 0.5
	hsp = Movespeed
	Move = (key_left + key_right)
	landAnim = 0
	sprite_index = spr_lonegustavo_punch
	if (Move != 0)
	{
		dir = Move
		Movespeed = approach(Movespeed, (Move * ratmount_Movespeed), 0.5)
	}
	else
		Movespeed = approach(Movespeed, 0, 0.5)
	ratmountpunchtimer--
	if (ratmountpunchtimer < 0)
	{
		state = states.ratmount
		if (hsp != 0)
		{
			dir = sign(hsp)
			Xscale = dir
		}
	}
	if (punch_afterimage > 0)
		punch_afterimage--
	else
	{
		punch_afterimage = 5
		create_mach3effect(x, y, sprite_index, image_index, Xscale)
	}
	exit;
}

