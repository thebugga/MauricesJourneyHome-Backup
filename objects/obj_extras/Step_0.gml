scr_getinput()
if !instance_exists(obj_manual)
{
	selected = clamp(selected + (key_down2 - key_up2), 0, array_length(selectmap) - 1)
	if key_jump
	{
		key_jump = 0
		switch selected
		{
			case 0:
				alarm[0] = 1
				break
			case 1:
				instance_create(x, y, obj_manual)
				break
			case 2:
				url_open("https://discord.gg/nhkT69y52P")
				break
		}
	}
	if (key_slap2)
		instance_destroy()
}
