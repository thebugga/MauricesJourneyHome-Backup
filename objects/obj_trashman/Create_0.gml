event_inherited()

sprs.move = spr_trashman_walk
sprs.stun = spr_trashman_stun
sprs.scared = spr_trashman_scared
sprs.dead = spr_trashman_dead

throwreset = 100
throwfunc = function()
{
	hsp = 0
	if anim_ended()
	{
		state = states.normal
		reset_anim(sprs.move)
	}
	
	if throwreset <= 0 && floor(image_index) == 6
	{
		throwreset = 200
		with (instance_create(x, y, obj_arcprojectile))
		{
			baddieID = other.id
			sprite_index = spr_junk
			image_index = irandom(sprite_get_number(spr_junk))
			image_speed = 0
			image_xscale = other.xscale
			hsp = (image_xscale * 6)
			vsp = -8
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