function player_actor()
{
	switch (sprite_index)
	{
		case spr_exitdoor:
			if anim_ended()
				state = states.normal
			if particle_timer > 0
				particle_timer--
			else
			{
				particle_timer = 14
				scr_sound_3d_pitched(sfx_step, x, y)
			}
			break;
		case spr_Timesup:
			if anim_ended()
			{
				if room != rm_timesup && !instance_exists(obj_titlecard)
					state = states.normal
				else
					image_speed = 0
			}
			break;
		case spr_upbox:
			vsp = 0
			break;
	}
}