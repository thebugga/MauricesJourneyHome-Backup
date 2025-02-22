if (grounded && state != states.hit && state != states.stun)
{
	if (jugglecount > 0)
		jugglecount--
	else
		jugglecount = 0
}
scr_collision()