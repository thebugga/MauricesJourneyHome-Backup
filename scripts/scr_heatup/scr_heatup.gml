function scr_heatup()
{
	global.baddiespeed += 1
	if (global.stylethreshold == 2)
		global.baddiepowerup = 1
	if (global.stylethreshold >= 2)
	{
		global.baddierage = 1
		obj_heatafterimage.visible = true
	}
	scr_tvtopmessage(["HEAT UP!!"])
	obj_stylebar.toggle = 1
	obj_stylebar.alarm[0] = 5
	exit;
}

