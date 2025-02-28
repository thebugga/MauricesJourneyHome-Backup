if (state == states.hurt)
{
	state = states.normal
	movespeed = 0
	if place_meeting_solid(x, y)
	{
		var ty = try_solid(0, 1, 312, 32)
		if (ty != -1)
			y += ty
	}
}
else if (state == states.ratmounthurt)
{
	state = states.ratmount
	movespeed = 0
}
