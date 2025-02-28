function cutscene_entrance_start()
{
	with (obj_parent_player)
	{
		state = states.actor
		sprite_index = spr_walkfront
		image_speed = 0.35
		other.Xscale = Xscale
		other.spr_idle = spr_idle
	}
	cutscene_end_action()
}
