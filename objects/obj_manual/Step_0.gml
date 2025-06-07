get_input()
if !showlinks
{
	frame += (uikey_right.pressed - uikey_left.pressed)
	frame = clamp(frame, 0, sprite_get_number(spr_manual))
	if prevframe != frame
	{
		//scr_soundeffect(sfx_step)
		prevframe = frame
	}
}
if key_taunt.pressed && frame != sprite_get_number(spr_manual)
	showlinks = !showlinks
if uikey_deny.pressed
	instance_destroy()
if frame == sprite_get_number(spr_manual)
{
	totemy -= (uikey_down.down - uikey_up.down) * 4
	totemy = clamp(totemy, -((array_length(totems) * 128) - screen_h), 0)
}