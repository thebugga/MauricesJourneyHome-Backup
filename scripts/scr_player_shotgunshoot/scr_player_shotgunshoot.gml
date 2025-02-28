function scr_player_shotgunshoot()
{
	image_speed = 0.4
	Move = (key_left + key_right)
	hsp = (Xscale * Movespeed)
	if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))))
		Movespeed = 0
	if (Move != 0)
	{
		if (Move == Xscale)
			Movespeed = approach(Movespeed, 4, 0.25)
		else
			Movespeed = approach(Movespeed, -8, 0.2)
	}
	else
		Movespeed = approach(Movespeed, 0, 0.1)
	if (floor(image_index) == (image_number - 1))
	{
		if grounded
			state = states.normal
		else
			state = states.jump
		if (Move == (-Xscale))
		{
			Xscale = Move
			dir = Xscale
			Movespeed = abs(Movespeed)
			momemtum = 1
		}
	}
	if key_jump
		input_buffer_jump = 0
	if key_slap2
		input_buffer_slap = 0
	if (key_shoot2 && image_index > (image_number - 3))
		scr_shotgunshoot()
	exit;
}

