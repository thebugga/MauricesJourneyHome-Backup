if (global.doisecutscene1 == -4)
	global.doisecutscene1 = quick_ini_read_real(get_savefile_ini(), "Cutscene", "doise1", 0)
if (global.doisecutscene1)
	instance_destroy(self, false)
