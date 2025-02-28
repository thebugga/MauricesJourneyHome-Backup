function scr_player_cheesepeplaunch()
{
	hsp = (Xscale * movespeed)
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
		Wallmovespeed = movespeed
		if (vsp < 0)
		{
			Wallmovespeed = (movespeed - 2)
			if (Wallmovespeed < 2)
				Wallmovespeed = 6
			if (Wallmovespeed > 8)
				Wallmovespeed = 8
		}
		else
			Wallmovespeed = 0
		movespeed = 0
		sticktime = 10
	}
	exit;
}

