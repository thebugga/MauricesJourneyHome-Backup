scr_getinput()
switch state
{
	case states.actor:
		if !instance_exists(obj_option) && !instance_exists(obj_extras)
		{
			menuselect = clamp(menuselect + (key_left2 + key_right2), 0, 3)
			if (key_start || key_jump)
			{
				key_jump = 0
				menu[menuselect][1]()
			}
		}
		break
	case states.gameover:
		if (key_jump)
			game_end()
		else if (key_slap2)
			state = states.actor
		break
	case states.transitioncutscene:
	case states.transition:
		obj_title.image_alpha = approach(obj_title.image_alpha, 0.5, 0.01)
		flicker_buffer--
		if flicker_buffer == 0
		{
			flicker_buffer = 2
			flicker *= -1
		}
		break
	case states.normal:
		saveselect = clamp(saveselect + (key_left2 + key_right2), 1, 3)
		if key_jump
		{
			//scr_soundeffect(sfx_collectgiantpizza)
			state = states.transition
			alarm[0] = 200
		}
		if key_shoot2
		{
	        if file_exists(concat("saves/saveData", saveselect, ".ini"))
			{
	            file_delete(concat("saves/saveData", saveselect, ".ini"))
				//scr_soundeffect(sfx_explosion)
			}
		}
		if key_slap2
			state = states.actor
		break
}
if (state == states.normal || state == states.transition)
{
	ini_open(concat("saves/saveData", saveselect, ".ini"))
	var percent = ini_read_real("Game", "percent", 0)
	ini_close()
	perstatus_icon = floor(percent / 14.285714285714286)
    var a = (floor((abs(percvisual - percent)) / 10)) + 1
    percvisual = approach(percvisual, percent, a)
	if (perstatus_icon > (sprite_get_number(spr_title_collysia) - 1))
	    perstatus_icon = sprite_get_number(spr_title_collysia) - 1
	if (percent >= 101)
	    perstatus_icon = 8
}