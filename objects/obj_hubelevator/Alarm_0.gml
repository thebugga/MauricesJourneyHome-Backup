if !quick_ini_read_real(get_savefile_ini(), "Cutscene", "elevator2", 0)
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
			with (obj_parent_player)
			{
		        lastroom_x = x
		        lastroom_y = y
		        lastroom = room
		        targetDoor = "A"
				state = states.comingoutdoor
		        targetRoom = hub_tutorial1
			}
	        fadein = true
	        quick_ini_write_real(get_savefile_ini(), "Cutscene", "elevator2", true)
	        instance_create(x, y, obj_fadeout)
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
	with (obj_parent_player)
	{
        lastroom_x = x
        lastroom_y = y
        lastroom = room
		targetRoom = other.hub_array[other.selected][0]
		targetDoor = other.hub_array[other.selected][1]
		state = states.comingoutdoor
	}
    fadein = true
	quick_ini_write_real(get_savefile_ini(), "Cutscene", hub_array[selected][3], true)
    instance_create(x, y, obj_fadeout)
}