function scr_player_finishingblow()
{
	hsp = Movespeed
	Movespeed = approach(Movespeed, 0, 0.25)
	if (floor(image_index) == (image_number - 1))
	{
		Movespeed = abs(Movespeed)
		state = states.normal
	}
	image_speed = 0.4
	landAnim = 0
	if ((!instance_exists(obj_dashcloud2)) && grounded && Movespeed > 3)
	{
		with (instance_create(x, y, obj_dashcloud2))
			image_xscale = other.Xscale
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

