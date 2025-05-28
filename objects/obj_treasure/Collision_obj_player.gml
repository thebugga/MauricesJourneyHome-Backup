if !collected
{
	with other
	{
		state = states.actor
		hsp = 0
		vsp = 0
		event_play_oneshot("event:/sfx/misc/treasure")
		other.x = x
		other.y = y
	}
	alarm[0] = 150
	
	collected = true
	scr_tvtopmessage("SECRET TREASURE ATTAINED!!!")
}