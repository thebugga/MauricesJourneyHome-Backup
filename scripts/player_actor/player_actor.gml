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
				event_play_oneshot_3d("event:/sfx/player/step", x, y)
			}
			break;
		case spr_Timesup:
			global.level_minutes = 0
			global.level_seconds = 0
			if anim_ended()
			{
				if room != rm_timesup && !instance_exists(obj_titlecard)
					state = states.normal
				else
					image_speed = 0
			}
			if room == rm_timesup && obj_timesup.image_xscale >= 1
			{
				sprite_index = spr_player_caughtontime
				image_speed = 0.35
				timeup_anglediff = -obj_timesup.image_angle
				timeup_angle = point_direction(obj_timesup.x, obj_timesup.y, x, y) - obj_timesup.image_angle
				timeup_dist = point_distance(obj_timesup.x, obj_timesup.y, x, y)
				visual_size = obj_timesup.image_yscale / 3
				rotation = timeup_anglediff + obj_timesup.image_angle
			}
			break;
		case spr_player_caughtontime:
		case spr_player_caughtontimeplant:
			if obj_timesup.image_xscale < 10
			{
				hsp = 0
				vsp = 0
				grav = 0
				alarm[3] = 90
				visual_size = obj_timesup.image_yscale / 3
			}
			else 
			{
				if sprite_index != spr_player_caughtontimeplant
				{
					sprite_index = spr_player_caughtontimeplant
					visual_size = 1.55
					shake_camera(20, 0.8)
				}
				visual_size = lerp(visual_size, 1.5, 0.1)
				y += floor(vsp)
				if (vsp < 30)
					vsp += grav
			}
			if grav == 0
			{
				x = obj_timesup.x + lengthdir_x(timeup_dist * obj_timesup.image_xscale, timeup_angle + obj_timesup.image_angle)
				y = obj_timesup.y + lengthdir_y(timeup_dist * obj_timesup.image_xscale, timeup_angle + obj_timesup.image_angle)
				rotation = timeup_anglediff + obj_timesup.image_angle
			}
			break
		case spr_upbox:
			vsp = 0
			break;
		case spr_enterdoor:
			if anim_ended()
				image_speed = 0
			break;
			
	}
}