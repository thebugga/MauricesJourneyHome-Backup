if (place_meeting(x, y + 1, obj_player) || place_meeting(x, y - 1, obj_player) || place_meeting(x - 1, y, obj_player) || place_meeting(x + 1, y, obj_player))
{
	if (place_meeting(x, y - 1, obj_player))
	{
		instance_destroy();
	}
}