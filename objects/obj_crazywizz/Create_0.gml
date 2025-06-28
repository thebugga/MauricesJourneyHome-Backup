event_inherited()

sprs.move = spr_crazywhiz_walk
sprs.stun = spr_crazywhiz_stun
sprs.scared = spr_crazywhiz_scared
sprs.dead = spr_crazywhiz_dead

throwreset = 100
throwfunc = function()
{
	hsp = 0
	if anim_ended()
	{
		state = states.normal
		reset_anim(sprs.move)
	}
	
	if throwreset <= 0
	{
		throwreset = 200
		with (instance_create(x, y, obj_lightningwarn))
		{
			baddieID = other.id
			followID = instance_nearest(x, y, obj_player)
		}
	}
}

state_struct = {
	normal: {state: states.normal, func: enemy_normal},
	scared: {state: states.scared, func: enemy_scared},
	grabbed: {state: states.grabbed, func: enemy_grabbed},
	stun: {state: states.stun, func: enemy_stun},
	hit: {state: states.hit, func: enemy_hit},
	shoot: {state: states.shoot, func: throwfunc}
}

do_turn = false