if place_meeting(x, (y - 1), obj_parent_player)
{
	with (obj_parent_player)
	{
		if (state != states.gotoplayer && place_meeting(x, (y + 1), other))
		{
			if (state == states.knightpep)
				state = states.knightpepslopes
			else if (state != states.knightpepslopes && state != states.Sjumpprep)
			{
				if (state != states.machslide && state != states.tumble && state != states.handstandjump && state != states.mach1 && state != states.mach2 && state != states.mach3)
				{
					if (icedir != (-Xscale) && move != 0)
					{
						if (prevmovespeed != 0)
							icemovespeed = prevmovespeed
						else
							icemovespeed = 8
						icedir = (-Xscale)
						savedicedir = (-Xscale)
					}
					if (prevmove != move && move == 0)
					{
						icemovespeed = (-((prevmovespeed - previcemovespeed)))
						icedir = (-Xscale)
					}
				}
				else if (state == states.machslide)
				{
					if (prevstate != state)
					{
						icedir = Xscale
						icemovespeed = floor((abs(movespeed) * 0.5))
					}
				}
				else if (state == states.tumble)
					icemovespeed = 0
			}
		}
	}
}
