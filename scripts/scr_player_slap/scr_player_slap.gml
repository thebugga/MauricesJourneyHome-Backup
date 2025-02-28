function scr_player_slap()
{
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		hsp = ((move * movespeed) + (_railinst.movespeed * _railinst.dir))
	}
	else
	{
		if move == 0 && movespeed > 0
			movespeed -= 0.25
		hsp = (Xscale * movespeed)
	}
	landAnim = 0
	if (slaphand == 1)
		sprite_index = spr_player_slap1
	if (slaphand == 2)
		sprite_index = spr_player_slap2
	if floor(image_index) == (image_number - 1)
	{
		if input_buffer_slap == 0
		{
			if (move != 0)
				dir = move
			if grounded
				state = states.normal
			else
			{
				sprite_index = spr_player_fall
				state = states.jump
			}
		}
		else
		{
			input_buffer_slap = 0
			if slaphand >= 2
			{
		        suplexmove = true
		        fmod_event_instance_play(suplexdashsnd)
		        state = states.handstandjump
				sprite_index = spr_player_lungestart
				movespeed = 10
			}
			else
			{
				movespeed = 6
				slaphand++
			}
			image_index = 0
		}
	}
	image_speed = 0.35
	exit;
}
