mask_index = spr_player_mask
switch state
{
	case states.normal:
		launch_buffer = 120
		break
	case states.ghostpossess:
		switch substate
		{
			case states.normal:
				var MoveH = (playerid.key_left + playerid.key_right)
				var MoveV = (playerid.key_down - playerid.key_up)
				if (MoveH != 0 or MoveV != 0)
				{
					MoveX = MoveH
					MoveY = MoveV
				}
				hsp = 0
				vsp = 0
				Rotation += 32
				if (launch_buffer > 0)
					launch_buffer--
				else
					substate = states.jump
				break
			case states.jump:
				var spd = 24
				hsp = (MoveX * spd)
				vsp = (MoveY * spd)
				Rotation += 64
				with (obj_destructibles)
				{
					if place_meeting((x - other.hsp), (y - other.vsp), other)
						instance_destroy()
				}
				with (obj_metalblock)
				{
					if place_meeting((x - other.hsp), (y - other.vsp), other)
						instance_destroy()
				}
				if place_meeting((x + hsp), (y + vsp), obj_solid)
				{
					instance_destroy()
					with (playerid)
					{
						state = states.ghost
						visible = true
					}
					state = states.normal
				}
				break
		}
		break
}

scr_collision()
event_inherited()
