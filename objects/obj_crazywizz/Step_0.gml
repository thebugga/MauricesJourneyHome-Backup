if escape_frozen
{
	visible = false
	
	if (distance_to_object(obj_player) <= 500 && alarm[1] == -1 && global.panic.active)
	{
		create_effect(x, y - 20, spr_pillarenemyspawner)
		alarm[1] = 22
	}
	
	exit;
}

do_enemy_generics(false)
collide()

if state == states.normal
{
	if throwreset > 0
		throwreset--
	else if distance_to_object(instance_nearest(x, y, obj_player)) < 400
	{
		reset_anim(spr_crazywhiz_shoot)
		state = states.shoot
	}
}