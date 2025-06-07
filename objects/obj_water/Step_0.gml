with obj_player
{
	var _id = other.plat1
	if state == states.mach3 || state == states.slide
		_id.x = clamp(x - 16, other.bbox_left, other.bbox_right)
	else
		_id.x = other.x - 32
}