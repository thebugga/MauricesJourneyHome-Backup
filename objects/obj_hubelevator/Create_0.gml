state = states.normal
hub_array[0] = [hub_tutorial1, "D", "BASEMENT TRAINING", "elevator2", global.elevatorcutscene2]
hub_array[1] = [hub_hallway, "B", "RECEPTION", "elevator1"]
hub_array[2] = [hub_pizzatower2complex, "A", "SUNNY CHECKERS", "elevator2"]
hub_array[3] = [rm_placeholder, "A", "JUPITERIAN FRIDGE", "TEMPORARY"]
hub_array[4] = [rm_placeholder, "A", "DISCO SHOWOFF", "TEMPORARY"]
hub_array[5] = [rm_placeholder, "A", "FOREST MAZE", "TEMPORARY"]
hub_array[6] = [rm_placeholder, "A", "COMPLEX HALLWAY", "TEMPORARY"]
hub_array[7] = [rm_placeholder, "A", "STICK ARENA", "TEMPORARY", 0]
playerid = -4
selected = 1
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
global.elevatorcutscene1 = quick_ini_read_real(get_savefile_ini(), "Cutscene", "elevator1", 0)
global.elevatorcutscene2 = quick_ini_read_real(get_savefile_ini(), "Cutscene", "elevator2", 0)