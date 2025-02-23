scr_getinput()
if canchoose
{
	bgalpha = approach(bgalpha, 0, 0.05)
	selected += (key_down2 - key_up2)
	if (key_down2 || key_up2)
		//scr_soundeffect(sfx_step)
	if (selected > array_length(optionarr) - 1)
		selected = 0
	if (selected < 0)
		selected = array_length(optionarr) - 1
	if key_jump
	{
		//scr_soundeffect(sfx_enemyprojectile)
		bgindex = optionarr[selected][2]
		canchoose = false
		instance_create(x, y, (optionarr[selected][1]))
	}
	if key_escape || key_slap2
	{
		//scr_soundeffect(sfx_enemyprojectile)
		instance_destroy()
	}
}
else
{
	bgalpha = approach(bgalpha, 1, 0.1)
	if key_slap2
	{
		for (var i = 0; i < array_length(optionarr); i++) 
			instance_destroy(optionarr[i][1])
		//scr_soundeffect(sfx_enemyprojectile)
		obj_option.alarm[0] = 2
	}
}
x--
y--
