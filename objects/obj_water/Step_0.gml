with (obj_player)
{
	if ((state == states.mach3 && !key_down.down) || state == states.slide) && place_meeting(x, y + 1, other)
	{
		y = other.bbox_top - (bbox_bottom - y)
		vsp = 0
		grounded = true
	}
}