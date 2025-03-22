with (other)
{
	if state != states.swimslow && state != states.mach1
	{
		if (state == states.tumble || state = states.freefall || (state = states.Sjump && sjumptimer == 0))
			state = states.mach1
		else
			state = states.swimslow
		sjumpangle = point_direction(0, 0, hsp, vsp)
		movespeed = point_distance(0, 0, hsp, vsp)
	}
}
