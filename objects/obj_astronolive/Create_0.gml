event_inherited()
HP = 2

sprs.move = spr_trashman_walk
sprs.stun = spr_trashman_stun
sprs.scared = spr_trashman_scared
sprs.dead = spr_trashman_dead

normstate = function()
{
	hsp = 0
	vsp = 0
	image_speed = 0.35
	
	y = approach(y, ystart, 1)
	
	if throwreset > 0
		throwreset--
	else if distance_to_object(instance_nearest(x, y, obj_player)) < 400 && y == ystart
	{
		xscale = sign(instance_nearest(x, y, obj_player).x - x)
		reset_anim(spr_trashman_spit)
		state = states.shoot
	}
}

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
	normal: {state: states.normal, func: normstate},
	scared: {state: states.scared, func: enemy_scared},
	grabbed: {state: states.grabbed, func: enemy_grabbed},
	stun: {state: states.stun, func: enemy_stun},
	hit: {state: states.hit, func: enemy_hit},
	shoot: {state: states.shoot, func: throwfunc}
}

do_turn = false