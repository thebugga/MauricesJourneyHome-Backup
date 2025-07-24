event_inherited()

state_struct = {
	normal: {state: states.normal, func: enemy_idle},
	scared: {state: states.scared, func: enemy_scared},
	grabbed: {state: states.grabbed, func: enemy_grabbed},
	stun: {state: states.stun, func: enemy_stun},
	hit: {state: states.hit, func: enemy_hit}
}

sprs = {
	move: spr_mancy,
	scared: spr_mancy,
	dead: spr_mancy,
	stun: spr_mancy,
	turn: spr_mancy
}
