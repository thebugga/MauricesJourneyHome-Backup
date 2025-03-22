with obj_parent_player
{
	var _id = object_index = obj_player1 ? other.plat1 : other.plat2
	if state == states.mach3 || state == states.machslide
		_id.x = clamp(x - 16, other.bbox_left, other.bbox_right)
	else
		_id.x = other.x - 32
}