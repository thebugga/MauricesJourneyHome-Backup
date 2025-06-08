state = states.normal
hub_array[0] = [tower_hallway, "B", "RECEPTION", "elevator2"]
hub_array[1] = [tower_towercomplex, "A", "PIZZA TOWER 2 LOBBY", "elevator2"]
hub_array[2] = [tower_towercomplex, "A", "PIZZA TOWER 2 LOBBY SKIPPABLE", "elevator1"]
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
	global.elevatorcutscene1 = quick_ini_read_real($"saves/saveData{global.savefile}.ini", "Cutscene", "elevator1", 0)
global.elevatorcutscene2 = quick_ini_read_real($"saves/saveData{global.savefile}.ini", "Cutscene", "elevator2", 0)