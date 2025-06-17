if !collected
{
	with obj_player
	{
		reset_anim(spr_idle)
		state = states.actor
		hsp = 0
		vsp = 0
	}
	with other
	{
		event_play_oneshot("event:/sfx/misc/treasure")
		other.x = x
		other.y = y
	}
	
	alarm[0] = 150
	
	collected = true
	gotted_id = other.id
}