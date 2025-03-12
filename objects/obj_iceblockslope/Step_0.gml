if place_meeting(x, (y - 1), obj_parent_player)
{
	var _dir = sign(image_xscale)
	with (obj_parent_player)
	{
		if (state != states.climbwall && (icemovespeed < 2 || place_meeting(x, (y + 1), obj_iceblock)) && place_meeting(x, (y + 1), other) && slopeCheck(x + Xscale, y))
		{
			icemovespeed = 2
			icedir = (-_dir)
		}
		if (state == states.climbwall)
			icemovespeed = 0
	}
}
