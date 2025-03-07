if (animation_end() && obj_parent_player.state != states.door)
{
	with (obj_parent_player)
	{
		state = states.door
		image_index = 0
	}
	alarm[0] = 200
}
if (animation_end())
	image_speed = 0
