function cutscene_change_room(argument0)
{
	with (obj_parent_player)
		targetRoom = argument0
	instance_create(x, y, obj_fadeout)
	if (room == argument0)
		cutscene_end_action()
}
