function scr_player_shotgunshoot()
{
	image_speed = 0.4
	move = (key_left + key_right)
	hsp = (Xscale * movespeed)
	if (place_meeting((x + hsp), y, obj_solid) && (!(place_meeting((x + hsp), y, obj_slope))))
		movespeed = 0
	if (move != 0)
	{
		if (move == Xscale)
			movespeed = approach(movespeed, 4, 0.25)
		else
			movespeed = approach(movespeed, -8, 0.2)
	}
	else
		movespeed = approach(movespeed, 0, 0.1)
	if (animation_end())
	{
		if grounded
			state = states.normal
		else
			state = states.jump
		if (move == (-Xscale))
		{
			Xscale = move
			dir = Xscale
			movespeed = abs(movespeed)
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

