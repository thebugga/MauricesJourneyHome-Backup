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
chary = -14
charvely = 0
fadealpha = 0
if (global.elevatorcutscene1 == -4)
	global.elevatorcutscene1 = quick_ini_read_real(get_savefile_ini(), "Cutscene", "elevator1", 0)
if (global.elevatorcutscene2 == -4)
	global.elevatorcutscene2 = quick_ini_read_real(get_savefile_ini(), "Cutscene", "elevator2", 0)