if (place_meeting(x, (y + 1), obj_parent_player) && (!instance_exists(obj_crashingplane)))
	instance_create(obj_parent_player.x, obj_parent_player.y, obj_crashingplane)
