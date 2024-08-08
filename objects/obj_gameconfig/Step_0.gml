scr_getinput()
if (key_jump)
{
	switch (selected)
	{
		case -1:
			instance_destroy()
			obj_option.alarm[0] = 2
			break;
		case 0:
			global.option_timer = !global.option_timer
			break;
		case 1:
			global.option_timer_type = !global.option_timer_type
			
			break;
	}
}
selected += (key_down2 - key_up2)
if selected > 1
	selected = -1
if selected < -1
	selected = 1
