if playerr == -4
{
	with (instance_create(x, y, obj_smallnumber))
		number = "1000"
	instance_create(x, y, obj_taunteffect)
	persistent = true
	alarm[0] = 120
	playerr = other.object_index
	global.goochlinggot[image_index] = 1
	if image_index == 4
		scr_tvtopmessage("WOWIE! SUPER SECRET GOOCHLING RECIEVED!")
	else
	{
		global.toppintotal += 1
		if (global.toppintotal < 4)
			scr_tvtopmessage(("GOOCHLING " + string(global.toppintotal)) + " RECIEVED!")
		else if (global.toppintotal == 4)
			scr_tvtopmessage("ALL GOOCHLINGS RECIEVED!")
	}
	ds_list_add(global.saveroom, id)
}