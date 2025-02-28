with (obj_parent_player)
{
	if (state == states.mach3 && Movespeed > 16 && place_meeting((x + hsp), y, other))
		instance_destroy(other)
}
