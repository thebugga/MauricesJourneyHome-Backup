if (distance_to_object(obj_player) <= 150 || global.level_minutes > timer)
{
	if global.level_minutes <= timer
	instance_destroy();
}
