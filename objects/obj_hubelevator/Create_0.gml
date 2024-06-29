state = states.normal
hub_array[0] = [hub_reception, "RECEPTION"]
hub_array[1] = [hub_pizzatowerlobby, "PIZZA TOWER LOBBY"]
isgustavo = 0
playerid = -4
selected = 0

switch room
{
	case hub_room1:
		selected = 0
		break
	case hub_room2:
		selected = 1
		break
}
