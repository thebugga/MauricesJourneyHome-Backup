scr_getinput()
switch state
{
	case states.actor:
		if (key_start || key_jump2)
		{
			state = states.transitioncutscene
			alarm[0] = 100
		}
		break
	case states.transitioncutscene:
	case states.transition:
		obj_title.image_alpha = Approach(obj_title.image_alpha, 0.5, 0.01)
		flicker_buffer--
		if flicker_buffer == 0
		{
			flicker_buffer = 2
			flicker *= -1
		}
		break
	case states.normal:
		if !instance_exists(obj_option)
		{
			saveselect = clamp(saveselect + (key_left2 + key_right2), 1, 3)
			if key_jump
			{
				scr_soundeffect(sfx_collectgiantpizza)
				state = states.transition
				alarm[0] = 200
			}if key_shoot2
			{
	            if file_exists(concat("saves/saveData", saveselect, ".ini"))
				{
	                file_delete(concat("saves/saveData", saveselect, ".ini"))
					scr_soundeffect(sfx_explosion)
				}
			}
			if key_start
			{
				scr_soundeffect(sfx_enemyprojectile)
				instance_create(x, y, obj_option)
			}
		}
		break
}
if (state == states.normal || state == states.transition)
{
	var percent = quick_ini_read_real(concat("saveData", saveselect, ".ini"), "Game", "percent", 0)
	perstatus_icon = floor(percent / 14.285714285714286)
    var a = (floor((abs(percvisual - percent)) / 10)) + 1
    percvisual = Approach(percvisual, percent, a)
	if (perstatus_icon > (sprite_get_number(spr_title_collysia) - 1))
	    perstatus_icon = sprite_get_number(spr_title_collysia) - 1
	if (percent >= 101)
	    perstatus_icon = 8
}