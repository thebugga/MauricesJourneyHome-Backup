targetRoom = rm_test
level = "temple"
titlecardi = 0
if (global.dougiecutscene1 == -4)
	global.dougiecutscene1 = quick_ini_read_real(get_savefile_ini(), "Cutscene", "dougie1", 0)
if !global.dougiecutscene1
	instance_destroy()