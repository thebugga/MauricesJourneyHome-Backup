function scr_player_bump()
{
	if (sprite_index != spr_wallsplat)
	{
		movespeed = 0
		mach2 = 0
		start_running = 1
		alarm[4] = 14
		if (grounded && vsp > 0)
		hsp = 0
		var can_end = 1
		if (sprite_index == spr_tumbleend)
			can_end = (!(place_meeting(x, y, obj_pepgoblin_kickhitbox)))
		if (sprite_index == spr_tumbleend && ((!grounded) or (!can_end)))
			image_speed = 0
		else
			image_speed = 0.35
		if (sprite_index == spr_rockethitwall && grounded)
			image_index = (image_number - 1)
		if (floor(image_index) == (image_number - 1) && sprite_index != spr_player_catched && sprite_index != spr_boxxedpep_air)
		{
			if (!skateboarding)
			{
				if (sprite_index != spr_rockethitwall or grounded)
					state = states.normal
			}
			else
				state = states.mach2
		}
		if (sprite_index != spr_player_catched && sprite_index != spr_boxxedpep_air && sprite_index != spr_rockethitwall && sprite_index != spr_tumbleend && sprite_index != spr_hitwall)
			sprite_index = ((!skateboarding) ? spr_bump : spr_clownbump)
		if (sprite_index == spr_hitwall && character == "D")
		{
			if image_index >= 3 && !grounded
				image_speed = 0
			else
				image_speed = 0.35
			if (input_buffer_slap > 0 && !grounded)
			{
			    input_buffer_slap = 0
				jumpstop = true
				mach2 = 0
				sprite_index = spr_playerN_skateboarddoublejump
				image_index = 0
				move = (key_left + key_right)
				if move != 0
					xscale = move
			    movespeed = 10
				vsp = -10
			    state = states.mach2
				fmod_event_one_shot_3d("event:/sfx/maurice/superjumpcancel", x, y)
			}
		}
	}
	else
	{
		movespeed = 0
		hsp = 0
		vsp = 0
		if (floor(image_index) == (image_number - 1))
			state = states.normal
		image_speed = 0.35
	}
	exit;
}

