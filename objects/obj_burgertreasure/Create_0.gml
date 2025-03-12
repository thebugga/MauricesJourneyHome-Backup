event_inherited()
got_func = function()
{
	if (global.bombcutscene == -4 || (!global.bombcutscene))
	{
		global.bombcutscene = 1
		quick_ini_write_real(get_savefile_ini(), "Cutscene", "bomb", 1)
	}
	exit;
}

if (global.bombcutscene == -4)
	global.bombcutscene = quick_ini_read_real(get_savefile_ini(), "Cutscene", "bomb", 0)
if global.bombcutscene
	instance_destroy()
if (global.graveyardcutscene == -4)
	global.graveyardcutscene = quick_ini_read_real(get_savefile_ini(), "Cutscene", "graveyard", 0)
if ((!global.graveyardcutscene) && (!global.levelcomplete))
	instance_destroy()
