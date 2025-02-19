if (minitext_pos >= array_length(minitext))
	alarm[0] = 150
else
{
	//scr_soundeffect(sfx_step)
	minitext[minitext_pos][0] = true
	minitext_pos++
	alarm[1] = 5
}