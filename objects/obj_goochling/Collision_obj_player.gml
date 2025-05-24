if playerr == -4
{
	with instance_create(x, y, obj_collect_number)
		num = 1000
	persistent = true
	alarm[0] = 120
	playerr = other.object_index
	scr_sound(sfx_collecttoppin)

	global.level_data.goochlings[image_index] = true
	global.combo.timer = 60

	with obj_tv
		tv_cardboard(2)
	
	if image_index == 4
		scr_tvtopmessage("WOWIE! SUPER SECRET GOOCHLING RECIEVED!")
	else
	{
		var nowgooch = 0
		for (var i = 0; i < 4; i++)
			nowgooch += global.level_data.goochlings[i]
		
		if (nowgooch < 4)
			scr_tvtopmessage("GOOCHLING " + string(image_index + 1) + " RECIEVED!")
		else
			scr_tvtopmessage("ALL GOOCHLINGS RECIEVED!")
	}
}