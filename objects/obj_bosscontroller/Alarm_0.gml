if (state == BCstates.transitioncutscene)
	exit;
if (state == BCstates.victory)
	exit;
round_timer--
if (round_timer <= 0)
{
	if (round_count < round_max)
	{
		round_count++
		minutes = maxminutes
		seconds = maxseconds
		state = BCstates.arenaround
		timer_buffer = timer_max
	}
}
if (state != BCstates.arenaround && state != BCstates.victory)
	alarm[0] = 1
