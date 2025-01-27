got_func = function()
{
	if (global.bombcutscene == -4 or (!global.bombcutscene))
	{
		global.bombcutscene = 1
		quick_ini_write_real(get_savefile_ini(), "Cutscene", "bomb", true)
	}
	exit;
}

if (global.bombcutscene == -4)
	global.bombcutscene = quick_ini_read_real(get_savefile_ini(), "Cutscene", "bomb", 0)
if global.bombcutscene
	instance_destroy()