function scr_player_trashjump()
{
	image_speed = 0.35
	hsp = Movespeed
	Move = (key_left + key_right)
	if (Move != 0)
		Movespeed = approach(Movespeed, (Move * 6), 0.5)
	else
		Movespeed = approach(Movespeed, 0, 0.25)
	if (vsp > 0 && sprite_index == spr_player_trashjump)
	{
		sprite_index = spr_player_trashjump2
		image_index = 0
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_player_trashjump2)
		sprite_index = spr_player_trashfall
	if (vsp < 0 && sprite_index != spr_player_trashjump)
		sprite_index = spr_player_trashjump
	if (grounded && vsp > 0)
	{
		if instance_place(x, (y + 1), obj_slope)
		{
			var slope = instance_place(x, (y + 1), obj_slope)
			Xscale = (-sign(slope.image_xscale))
		}
		Movespeed = abs(Movespeed)
		dir = Xscale
		Movespeed += 3
		instance_create(x, y, obj_jumpdust)
		state = states.trashroll
	}
	exit;
}

