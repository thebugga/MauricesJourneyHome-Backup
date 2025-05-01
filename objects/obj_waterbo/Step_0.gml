event_inherited();

if state == states.normal
{
	if throwreset > 0
		throwreset--
	else
	{
		reset_anim(spr_waterbo_spill)
		state = states.shoot
	}
}