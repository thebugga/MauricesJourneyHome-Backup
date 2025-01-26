with (obj_parent_player)
{
	targetDoor = "A"
	targetRoom = other.targetRoom
	if (!instance_exists(obj_fadeout))
		instance_create(x, y, obj_fadeout)
}
