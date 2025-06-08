switch state
{
	case states.actor:
			if playerid.key_up.pressed
				selected++
			if playerid.key_down.pressed
				selected--
			selected = clamp(selected, 0, (array_length(hub_array) - 1))
			if playerid.key_jump.pressed
			{
				if (hub_array[selected][0] != room)
				{
					if quick_ini_read_real($"saves/saveData{global.savefile}.ini", "Cutscene", hub_array[selected][3], 0)
					{
						with (obj_player)
							do_fade(other.hub_array[other.selected][0], other.hub_array[other.selected][1], fade_types.door)
					}
					else
					{
				        stop_music()
						event_play_oneshot("event:/music/levator")
						fadein = 1
						state = states.grab
					}
				}
			}
			if playerid.key_grab.pressed
			{
				state = states.normal
				with (obj_player)
				{
					state = states.normal
					key_grab.pressed = 0
				}
			}
		break;
	case states.grab:
		if fadein
		{
		    fadealpha = approach(fadealpha, 1, 0.1)
		    if (fadealpha >= 1 && showinside == false)
		    {
        
		        showinside = true
		        fadein = false
		        alarm[0] = (global.cutscene.elevator2 ? 600 : 300)  
		    }
		}
		else
		    fadealpha = approach(fadealpha, 0, 0.1)
		if charvely != 0
		{
		chary += charvely
		charvely++
		}
		if floor(charindex) < (sprite_get_number(charsprite) - 1)
			charindex += 0.35
		if floor(elavatorindex) < (sprite_get_number(elavatorsprite) - 1)
			elavatorindex += 0.35
		break;
}
