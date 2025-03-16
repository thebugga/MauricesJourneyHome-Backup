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
					if quick_ini_read_real(get_savefile_ini(), "Cutscene", hub_array[selected][3], 0)
					{
						with (obj_parent_player)
						{
					        lastroom_x = x
					        lastroom_y = y
					        lastroom = room
							targetRoom = other.hub_array[other.selected][0]
							targetDoor = other.hub_array[other.selected][1]
							state = states.comingoutdoor
						}
					    instance_create(x, y, obj_fadeout)
					}
					else
					{
				        stop_music()
						event_play_oneshot("event:/music/levator")
						fadein = 1
						state = states.backbreaker
					}
				}
			}
			if playerid.key_slap2
			{
				state = states.normal
				with (obj_parent_player)
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
		    fadealpha = approach(fadealpha, 1, 0.1)
		    if (fadealpha >= 1 && showinside == false)
		    {
        
		        showinside = true
		        fadein = false
		        alarm[0] = (global.elevatorcutscene2 ? 600 : 300)  
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
		break
}
