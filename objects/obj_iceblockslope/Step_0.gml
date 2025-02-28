if place_meeting(x, (y - 1), obj_parent_player)
{
	var _dir = sign(image_xscale)
	with (obj_parent_player)
	{
		if (state != states.climbwall && (iceMovespeed < 2 or place_meeting(x, (y + 1), obj_iceblock)) && place_meeting(x, (y + 1), other) && slopeCheck(x + Xscale, y))
		{
			iceMovespeed = 2
			icedir = (-_dir)
		}
		if (state == states.climbwall)
			iceMovespeed = 0
	}
}
