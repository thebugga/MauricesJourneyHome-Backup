if !quick_ini_read_real($"saves/saveData{global.savefile}.ini", "Cutscene", "elevator2", 0)
{
	if elavatorsprite == spr_elevator_bgopen
	{
		if charvely == 0
		{
			charvely = 1
			alarm[0] = 200
		}
		else
		{
			with (obj_player)
				do_fade(tower_tutorial1, "b", fade_types.none)
	        fadein = true
	        quick_ini_write_real($"saves/saveData{global.savefile}.ini", "Cutscene", "elevator2", true)
	    }
	}
	else
	{
		charsprite = spr_elevator_maurice1shock
		elavatorsprite = spr_elevator_bgopen
		shake = 0
		alarm[0] = 100
	}
}
else
{
    stop_music()
	with (obj_player)
	{
        do_fade(other.hub_array[other.selected][0], other.hub_array[other.selected][1], fade_types.door)
	}
    fadein = true
	quick_ini_write_real($"saves/saveData{global.savefile}.ini", "Cutscene", hub_array[selected][3], true)
}