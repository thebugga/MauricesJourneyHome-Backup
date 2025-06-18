event_inherited();

if state == states.normal
{
	if throwreset > 0
		throwreset--
	else if distance_to_object(instance_nearest(x, y, obj_player)) < 400
	{
		reset_anim(spr_trashman_spit)
		state = states.shoot
	}
}