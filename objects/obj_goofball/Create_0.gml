event_inherited()

movespeed = 2
mynorms = function()
{
	hsp = movespeed * xscale
	if scr_solid(x + xscale, y)
		xscale *= -1
	if grounded
	{
		vsp = -8
		movespeed = approach(movespeed, 2, 0.5)
		waiting = false
		other.warp = -0.4
	}
	if stun_timer > 0
		stun_timer--
}

state_struct = {
	normal: {state: states.normal, func: mynorms},
	grabbed: {state: states.grabbed, func: enemy_grabbed},
	stun: {state: states.stun, func: mynorms},
	hit: {state: states.hit, func: enemy_hit}
}