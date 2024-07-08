scr_getinput()
i += (key_left2 + key_right2)
i = clamp(i, 0, 12)
if previ != i
{
	scr_soundeffect(sfx_step)
	previ = i
}