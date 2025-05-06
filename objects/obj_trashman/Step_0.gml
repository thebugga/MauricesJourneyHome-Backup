event_inherited();

if state == states.normal
{
	if throwreset > 0
		throwreset--
	else
	{
		reset_anim(spr_trashman_spit)
		state = states.shoot
	}
}