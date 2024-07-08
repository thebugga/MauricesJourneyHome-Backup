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
			saveselect += (key_left2 + key_right2)
			saveselect = clamp(saveselect, 1, 3)
			if key_jump
			{
				scr_soundeffect(sfx_collectgiantpizza)
				state = states.transition
				alarm[0] = 200
			}
			if key_start
			{
				scr_soundeffect(sfx_enemyprojectile)
				instance_create(x, y, obj_option)
			}
		}
		break
}