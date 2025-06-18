event_inherited()

sprs.move = spr_waterbo_walk
sprs.stun = spr_waterbo_stun
sprs.scared = spr_waterbo_scared
sprs.dead = spr_waterbo_dead

throwreset = 200
throwfunc = function()
{
	hsp = 0
	if anim_ended()
	{
		state = states.normal
		reset_anim(sprs.move)
	}
	
	if throwreset <= 0 && floor(image_index) == 15
	{
		throwreset = 200
		with obj_slipnslide
		{
			if baddieID == other.id
				instance_destroy()
		}
		with (instance_create(x, y, obj_slipnslide))
		{
			baddieID = other.id
			image_xscale = other.xscale
			hsp = (other.xscale * 5)
			vsp = -3
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