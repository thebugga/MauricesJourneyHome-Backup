function scr_enemy_walk()
{
	if (object_index != obj_robot && object_index != obj_pizzice && object_index != obj_ancho)
		hsp = ((image_xscale * movespeed) + railmovespeed)
	else if (object_index == obj_robot)
		hsp = railmovespeed
	if place_meeting(x, (y + 1), obj_railparent)
	{
		var _railinst = instance_place(x, (y + 1), obj_railparent)
		railmovespeed = (_railinst.movespeed * _railinst.dir)
	}
	else
		railmovespeed = 0
	if ((!grounded) && object_index != obj_pizzaball && object_index != obj_ancho && object_index != obj_miniufo && object_index != obj_kentukybomber)
		hsp = 0
	if (turntimer > 0 && turner == 1)
		turntimer--
	if ((place_meeting_solid((x + 1), y) && image_xscale == 1) or (place_meeting_solid((x - 1), y) && image_xscale == -1) or place_meeting((x + hsp), y, obj_hallway) or turntimer <= 0)
	{
		if (!(place_meeting((x + sign(hsp)), y, obj_slope)))
		{
			if (object_index == obj_forknight)
			{
				image_xscale *= -1
				image_index = 0
				sprite_index = spr_forknight_turn
				state = states.idle
			}
			else
			{
				if (!turnstart)
					turnstart = 1
				else
					image_xscale *= -1
				if (object_index == obj_miniufo or object_index == obj_kentukybomber)
					turntimer = turnmax
			}
			turntimer = turnmax
		}
	}
	if object_index != obj_ancho
	{
		if (!((place_meeting_solid((x + (image_xscale * 15)), (y + 31)) or place_meeting((x + (image_xscale * 15)), (y + 31), obj_platform))))
		{
			if (movespeed > 0 && grounded)
			{
				if (object_index == obj_forknight)
				{
					image_xscale *= -1
					image_index = 0
					sprite_index = spr_forknight_turn
					state = states.idle
				}
				else
				{
					image_xscale *= -1
				}
				turntimer = turnmax
			}
		}
	}
	exit;
}

