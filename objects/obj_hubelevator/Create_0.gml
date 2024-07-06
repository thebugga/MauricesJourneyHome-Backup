state = states.normal
hub_array[0] = [hub_entrance, "B", "RECEPTION"]
hub_array[1] = [hub_lobby, "A", "PIZZA TOWER 2 LOBBY"]
playerid = -4
selected = 0
for (var i = 0; i < array_length(hub_array); i++)
	{
		if room == hub_array[i]
			selected = i
	}
shake = 1
showinside = false
fadein = false
charsprite = spr_elevator_maurice1
charindex = 0
elavatorsprite = spr_elevator_bg
elavatorindex = 0
chary = 0
charvely = 0
trapdoor = false
fadealpha = 0