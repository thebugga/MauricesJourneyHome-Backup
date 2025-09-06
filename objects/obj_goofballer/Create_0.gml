event_inherited()
myball = instance_create(x, y, obj_goofball)

mynorms = function()
{
	if myball
	{
		x = myball.x
		if place_meeting(x, y, myball)
			vsp = -10
	}
}

state_struct = {
	normal: {state: states.normal, func: mynorms},
	scared: {state: states.scared, func: enemy_scared},
	grabbed: {state: states.grabbed, func: enemy_grabbed},
	stun: {state: states.stun, func: enemy_stun},
	hit: {state: states.hit, func: enemy_hit}
}