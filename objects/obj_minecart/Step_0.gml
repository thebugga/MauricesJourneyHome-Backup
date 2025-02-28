mask_index = spr_player_mask
var _destroy = 0
switch state
{
	case states.normal:
		if (grounded && vsp > 0)
		{
			hsp = approach(hsp, 0, 0.5)
			if (!(place_meeting(x, y, obj_minecart_rail)))
				_destroy = 1
		}
		substate = states.normal
		break
	
	case states.ghostpossess:
		key_left = playerid.key_left
		key_right = playerid.key_right
		key_jump = playerid.key_jump
		Move = (key_left + key_right)
		var spd = 12
		var accel = 0.1
		var deccel = 0.2
		switch substate
		{
			case states.normal:
				if place_meeting((x + sign(hsp)), y, obj_solid)
					Movespeed = 0
				if (Move != 0)
				{
					if (Move == Xscale)
						Movespeed = approach(Movespeed, spd, accel)
					else
					{
						Movespeed = approach(Movespeed, 0, accel)
						if (Movespeed <= 0)
						{
							Xscale = Move
							Movespeed = 0
						}
					}
				}
				else
					Movespeed = approach(Movespeed, 0, deccel)
				hsp = (Xscale * Movespeed)
				if key_jump
					playerid.input_buffer_jump = 0
				if (playerid.input_buffer_jump < 8)
				{
					playerid.input_buffer_jump = 8
					substate = states.jump
					vsp = -11
				}
				if ((!grounded) && vsp > 0)
					substate = states.jump
				if (!(place_meeting(x, y, obj_minecart_rail)))
					_destroy = 1
				break
			case states.jump:
				hsp = (Xscale * Movespeed)
				if place_meeting((x + sign(hsp)), y, obj_solid)
					Movespeed = 0
				if (grounded && vsp > 0)
					substate = states.normal
				break
		}
		break
}

with (obj_destructibles)
{
	if place_meeting((x - other.hsp), y, other)
		instance_destroy()
}
if (Movespeed > 10)
	instance_destroy(instance_place((x + hsp), y, obj_metalblock))
if _destroy
{
	instance_destroy()
	instance_create(xstart, ystart, obj_minecart)
	
	create_particle(xstart, ystart, particle.genericpoofeffect)
	create_particle(x, y, particle.genericpoofeffect)
	
	with (playerid)
	{
		state = states.ghost
		visible = true
	}
}
scr_collision()
event_inherited()
