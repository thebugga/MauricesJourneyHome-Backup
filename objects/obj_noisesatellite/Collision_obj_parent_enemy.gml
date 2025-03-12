with (other)
{
	if ((other.state == states.stun && other.thrown == true) || (other.state == states.grabbed && obj_parent_player.state == states.superslam))
		instance_destroy()
}
