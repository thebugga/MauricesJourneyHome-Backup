function scr_heatdown()
{
	global.baddiespeed -= 1
	if (global.stylethreshold != 2)
		global.baddiepowerup = 0
	if (global.stylethreshold < 2)
	{
		global.baddierage = 0
		obj_heatafterimage.visible = false
	}
	scr_tvtopmessage(["HEAT DOWN!!"])
	obj_stylebar.toggle = 1
	obj_stylebar.alarm[0] = 5
	exit;
}

