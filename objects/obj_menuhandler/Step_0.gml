get_input()

switch state
{
	case 0:
			if (uikey_accept.pressed) || room == mainmenu
				state = 1
		break
	case 1:
		if !instance_exists(obj_options) && !instance_exists(obj_manual)
		{
			menuselect = clamp(menuselect + (uikey_down.pressed - uikey_up.pressed), 0, array_length(menu) - 1)
			if (uikey_accept.pressed)
			{
				key_jump = 0
				menu[menuselect][1]()
			}
			
			if uikey_deny.pressed && room != mainmenu
				state = 0
		}
		break
	case 3:
		if uikey_accept.pressed
			game_end()
		else if uikey_deny.pressed
			state = 1
		break
	case 2:
		if global.savefile != saveselect
		{
			saveselect = clamp(saveselect + (uikey_right.pressed - uikey_left.pressed), 1, 4)
		
			for (var i = 0; i < array_length(character); i++)
			{
				var c = character[i]
			
				with c
				{
					if character <= p_characters.maurice
					{
						pal_ix = quick_ini_read_real($"saves/saveData{other.saveselect}.ini", $"Clothes{character}", "palette_index", 1)
						pat_spr = quick_ini_read_real($"saves/saveData{other.saveselect}.ini", $"Clothes{character}", "pattern_sprite", -4)
					}
				}
			}
		
			if uikey_accept.pressed
			{
				event_play_oneshot("event:/sfx/ui/fileselect")
				global.savefile = saveselect
				for (var i = 0; i < array_length(character); i++) 
				{
					with character[i]
						sprite = sprite_set.select
				}
				alarm[0] = 200
			}
			if key_taunt.pressed
			{
		        if file_exists(concat("saves/saveData", saveselect, ".ini"))
				{
		            file_delete(concat("saves/saveData", saveselect, ".ini"))
					//scr_soundeffect(sfx_explosion)
				}
			}
			if uikey_deny.pressed
				state = 1
		}
		break
}
if (state == 2)
{
	ini_open(concat("saves/saveData", saveselect, ".ini"))
	var percent = ini_read_real("Game", "percent", 0)
	ini_close()
	perstatus_icon = floor(percent / 14.285714285714286)
    var a = (floor((abs(percvisual - percent)) / 10)) + 1
    percvisual = approach(percvisual, percent, a)
	if (perstatus_icon > (sprite_get_number(spr_title_percent) - 1))
	    perstatus_icon = sprite_get_number(spr_title_percent) - 1
	if (percent >= 101)
	    perstatus_icon = 8
}