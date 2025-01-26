drawing = place_meeting(x, y, obj_parent_player)
if place_meeting(x, y, obj_parent_player)
	image_speed = 0.35
else
{
	image_speed = 0
	image_index = 0
}
if (msg != "" && distance_to_object(obj_parent_player) < 50)
{
	with (obj_tv)
	{
		message = other.msg
		showtext = 1
		alarm[0] = 2
	}
}
