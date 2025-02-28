if (playerid.object_index == obj_vigilanteboss && place_meeting(x, y, obj_parent_player))
{
	playerid.state = states.walk
	playerid.walkstate = states.walk
	playerid.Movespeed = 0
}
