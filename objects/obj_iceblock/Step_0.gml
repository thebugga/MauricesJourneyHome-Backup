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
					if (icedir != (-Xscale) && Move != 0)
					{
						if (prevMovespeed != 0)
							iceMovespeed = prevMovespeed
						else
							iceMovespeed = 8
						icedir = (-Xscale)
						savedicedir = (-Xscale)
					}
					if (prevMove != Move && Move == 0)
					{
						iceMovespeed = (-((prevMovespeed - previceMovespeed)))
						icedir = (-Xscale)
					}
				}
				else if (state == states.machslide)
				{
					if (prevstate != state)
					{
						icedir = Xscale
						iceMovespeed = floor((abs(Movespeed) * 0.5))
					}
				}
				else if (state == states.tumble)
					iceMovespeed = 0
			}
		}
	}
}
