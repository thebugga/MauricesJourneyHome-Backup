scr_getinput()
if !showlinks
{
	frame += (key_left2 + key_right2)
	frame = clamp(frame, 0, sprite_get_number(spr_manual))
	if prevframe != frame
	{
		scr_soundeffect(sfx_step)
		prevframe = frame
	}
}
if key_taunt2 && frame != sprite_get_number(spr_manual)
	showlinks = !showlinks
if frame == sprite_get_number(spr_manual)
{
	totemy += (key_up - key_down) * 4
	totemy = clamp(totemy, -((array_length(totems) * 128) - 540), 0)
}