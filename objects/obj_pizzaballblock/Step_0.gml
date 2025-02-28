with (obj_parent_player)
{
	if (place_meeting((x + Xscale), y, other) && state == states.backbreaker)
		instance_destroy(other)
}
with (obj_parent_player)
{
	if (place_meeting(x, (y + 1), other) && state == states.backbreaker)
		instance_destroy(other)
}
