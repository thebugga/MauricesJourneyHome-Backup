scr_getinput()
if (key_jump or keyboard_check_pressed(vk_return))
{
	obj_option.alarm[0] = 2
	instance_destroy()
}