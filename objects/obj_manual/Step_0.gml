scr_getinput()
if !showlinks
{
	frame += (key_left2 + key_right2)
	frame = clamp(frame, 0, sprite_get_number(spr_manual) - 1)
	if prevframe != frame
	{
		scr_soundeffect(sfx_step)
		prevframe = frame
	}
}
if key_taunt2
	showlinks = !showlinks