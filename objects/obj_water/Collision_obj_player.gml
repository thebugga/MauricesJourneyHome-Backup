with (other)
{
	if !((state == states.mach3 && !key_down.down) || state == states.slide) && state != states.swim && state != states.actor && state != states.noclip
	{
		if (state == states.tumble || ((state == states.mach2 || state == states.mach3) && key_down.down) || state = states.groundpound || (state = states.superjump && sjumptimer <= 0))
			reset_anim(spr_mach3)
		state = states.swim
		sjumpangle = point_direction(0, 0, hsp, vsp)
		movespeed = point_distance(0, 0, hsp, vsp)
	}
}
