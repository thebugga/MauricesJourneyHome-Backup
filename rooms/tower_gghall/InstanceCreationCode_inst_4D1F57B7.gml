got_func = function()
{
	if global.cutscene.bomb < 1
	{
		global.cutscene.bomb = true
		quick_ini_write_real($"saves/saveData{global.savefile}.ini", "Cutscene", "bomb", true)
	}
	exit;
}

if instance_exists(obj_rank)
{
    if !global.cutscene.garbage
	{
	    global.cutscene.garbage = true
	    quick_ini_write_real($"saves/saveData{global.savefile}.ini", "Cutscene", "garbage", true)
	}
}

global.cutscene.bomb = quick_ini_read_real($"saves/saveData{global.savefile}.ini", "Cutscene", "bomb", false)
if global.cutscene.bomb || !global.cutscene.garbage
	instance_destroy()