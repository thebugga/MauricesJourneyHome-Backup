function scr_player_pistolaim()
{
	landAnim = false;
	hsp = xscale * movespeed;
	momemtum = true;
	dir = xscale;
	image_speed = 0.5
	if grounded
		movespeed = Approach(movespeed, 0, 0.25)
	if (floor(image_index) >= (image_number - 1))
	{
		if key_attack
			state = states.mach2
		else
		{
			if grounded
				state = states.normal
			else
				state = states.jump
		}
	}
}

