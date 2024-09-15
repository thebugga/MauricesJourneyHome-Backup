targetRoom = rm_test
level = "retro"
titlecardi = 0
if (global.wizardcutscene == -4)
	global.wizardcutscene = quick_ini_read_real(get_savefile_ini(), "Cutscene", "wizard", 0)
if (!global.wizardcutscene)
	instance_destroy()