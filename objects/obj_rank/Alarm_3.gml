if (result_ix >= array_length(results))
	alarm[1] = 150
else
{
	scr_sound(sfx_step)
	results[result_ix][2] = true
	result_ix++
	alarm[3] = 5
}