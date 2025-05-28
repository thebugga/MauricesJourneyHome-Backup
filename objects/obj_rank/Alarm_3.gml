if (result_ix >= array_length(results))
	alarm[1] = 150
else
{
	event_play_oneshot("event:/sfx/player/step")
	results[result_ix][2] = true
	result_ix++
	alarm[3] = 5
}