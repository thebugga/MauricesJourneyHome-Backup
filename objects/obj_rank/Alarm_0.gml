if (text_pos >= array_length(texters))
{
	if rank_score >= rank_scorefinal
	{
		state++
		rank_score = rank_scorefinal
		reset_anim(rank_data[rank_ix].sprite)
		image_speed = 0.5
		if (rank_score >= global.rank_milestones.s && check_p_rank())
			receiptonscreen = false
		alarm[3] = 300
	}
	else
	{
		var sub = 0
		for (var i = 0; i < array_length(texters); i++)
		{
			if (texters[i][0])
				sub += 40
		}
		rank_score += (rank_scorefinal / (320 - sub))
		alarm[0] = 1
	}
}
else
{
	if texters[text_pos][2] > 0
	{
		with (obj_camera)
		{
			shake_mag = 2
			shake_mag_acc = 3 / room_speed
		}
		texters[text_pos][0] = true
		text_pos++
		alarm[0] = 40
	}
	else
	{
		text_pos++
		alarm[0] = 1
	}
}

