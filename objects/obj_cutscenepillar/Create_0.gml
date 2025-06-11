global.cutscene.doise1 = quick_ini_read_real($"saves/saveData{global.savefile}.ini", "Cutscene", "doise1", 0)
if (global.cutscene.doise1)
	instance_destroy(self, false)