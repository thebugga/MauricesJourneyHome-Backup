got_func = function()
{
	if (global.potioncutscene == -4 or (!global.potioncutscene))
	{
		global.potioncutscene = 1
		quick_ini_write_real(get_savefile_ini(), "Cutscene", "potion", 1)
	}
	exit;
}

if (global.potioncutscene == -4)
	global.potioncutscene = quick_ini_read_real(get_savefile_ini(), "Cutscene", "bomb", 0)
if global.potioncutscene
	instance_destroy()
if (global.wizardcutscene == -4)
	global.wizardcutscene = quick_ini_read_real(get_savefile_ini(), "Cutscene", "wizard", 0)
if ((!global.wizardcutscene) && (!global.levelcomplete))
	instance_destroy()
