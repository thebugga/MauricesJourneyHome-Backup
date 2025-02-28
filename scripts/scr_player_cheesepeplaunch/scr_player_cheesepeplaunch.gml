function scr_player_cheesepeplaunch()
{
	hsp = (Xscale * Movespeed)
	if (floor(image_index) == (image_number - 1))
	{
		if (sprite_index == spr_cheesepepjumpstart)
			sprite_index = spr_cheesepepjump
		else if (sprite_index == spr_cheesepepjump && vsp > 0)
			sprite_index = spr_cheesepepfall
	}
	if grounded
	{
		state = states.cheesepep
		sprite_index = spr_cheesepepland
		image_index = 0
	}
	if (place_meeting((x + sign(Xscale)), y, obj_solid) && (!(place_meeting(x, (y + 1), obj_slope))))
	{
		state = states.cheesepepstick
		WallMovespeed = Movespeed
		if (vsp < 0)
		{
			WallMovespeed = (Movespeed - 2)
			if (WallMovespeed < 2)
				WallMovespeed = 6
			if (WallMovespeed > 8)
				WallMovespeed = 8
		}
		else
			WallMovespeed = 0
		Movespeed = 0
		sticktime = 10
	}
	exit;
}

