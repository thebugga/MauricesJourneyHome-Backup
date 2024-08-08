switch state
{
	case states.titlescreen:
		if (!instance_exists(obj_fadeout))
		{
			if playerid.key_up2
				selected++
			if playerid.key_down2
				selected--
			selected = clamp(selected, 0, (array_length(hub_array) - 1))
			if playerid.key_jump2
			{
				if (hub_array[selected][0] != room)
				{
			        stop_music()
					fmod_event_one_shot("event:/music/levator")
					fadein = 1
					state = states.backbreaker
				}
			}
			if playerid.key_slap2
			{
				state = states.normal
				with (obj_player)
				{
					state = states.normal
					key_slap2 = 0
				}
			}
		}
		break
	case states.backbreaker:
		if fadein
		{
		    fadealpha = Approach(fadealpha, 1, 0.1)
		    if (fadealpha >= 1 && showinside == false)
		    {
        
		        showinside = true
		        fadein = false
		        alarm[0] = (global.elevatorcutscene2 ? 600 : 400)  
		    }
		}
		else
		    fadealpha = Approach(fadealpha, 0, 0.1)
		if charvely != 0
		{
		chary += charvely
		charvely++
		}
		if floor(charindex) < (sprite_get_number(charsprite) - 1)
			charindex += 0.35
		if floor(elavatorindex) < (sprite_get_number(elavatorsprite) - 1)
			elavatorindex += 0.35
		break
}
