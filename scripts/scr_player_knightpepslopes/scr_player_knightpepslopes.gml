function scr_player_knightpepslopes()
{
	var tracking = false
	var trackerid = -4
	with obj_wizardball
	{
		if playerid == other.id
		{
			tracking = true
			trackerid = id
		}
	}
	if tracking && trackerid
	{
		sprite_index = spr_knightpep_doublejump
		grav = 0
		var dir = point_direction(x, y, trackerid.x, trackerid.y)
		hsp = approach(hsp, lengthdir_x(15, dir), 0.5)
		vsp = approach(vsp, lengthdir_y(15, dir), 0.5)
		if place_meeting(x, y, trackerid) || input_buffer_slap > 0
		{
			input_buffer_slap = 0
			instance_destroy(trackerid)
		}
	}
	else
	{
		grav = 0.5
		if grounded
		{
			if sprite_index == spr_knightpep_doublejump
			{
				sprite_index = spr_knightpep_bump
				vsp = -6
			}
			else
			{
				movespeed = abs(hsp)
				state = states.knightpep
				sprite_index = spr_knightpep_fall
			}
		}
	}
	exit;
}

