function player_superjump() 
{
	image_speed = 0.35
	
	if sjumper
	{
		if (sprite_index == spr_player_Sjumpcancelstart)
		{
			image_speed = 0.5
			vsp = 0
			if (p_move != 0)
			  xscale = p_move
		}
		
		if sprite_index != spr_player_Sjumpcancelstart
		{
			if sjumptimer > 0
			{
				instakill = true
				if character == p_characters.undoised
				{
					var move_angle = point_direction(0, 0, (key_left.down - key_right.down), key_up.down - key_down.down)
					sjumpangle += clamp(angle_difference(sjumpangle, move_angle), -5, 5)
					hsp = lengthdir_x(15, sjumpangle)
					vsp = lengthdir_y(15, sjumpangle)
					
					if sjumpangle > 45 && sjumpangle < 135
						sprite_index = spr_player_superjump
					else if (sjumpangle > 240 && sjumpangle < 300) || (sjumpangle < -60 && sjumpangle > -120)
						sprite_index = spr_player_bodyslamfall
					else
					{
						sprite_index = spr_player_mach3
						xscale = sign(hsp)
					}
				}
				else
				{
					sprite_index = spr_player_superjump
					image_speed = abs(vsp) / 25
					vsp -= 0.5
				}
				sjumptimer--
			
				if (particle_timer > 0)
					particle_timer--
				else
				{
					particle_timer = 20
					with create_effect(x, y, spr_piledrivereffect)
					{
						image_yscale = -1
						depth = -150
					}
					create_effect(x, y, spr_cloudeffect)
				}
			}
			else
				sprite_index = spr_player_rockethitwall
		}
		
		if character == p_characters.undoised
		{
			if grounded && sprite_index == spr_player_mach3
			{
				movespeed = 12
				vsp = -8
				reset_anim(spr_rockethitwall)
				state = states.mach3
				jumpstop = false
			}
			else if scr_solid(x + sign(hsp), y + sign(vsp))
			{
				if scr_solid(x + sign(hsp), y)
					hsp *= -1
				else
					vsp *= -1
				if hsp != 0
				{
					movespeed = abs(hsp)
					xscale = sign(hsp)
				}
				state = states.slipnslide
				reset_anim(spr_slipbanana1)
				image_speed = 0.35
			} 
		}
		else
		{
			if grounded && sjumptimer <= 0
			{
				reset_anim(spr_fallfarland)
				state = states.bump
				event_play_oneshot_3d("event:/sfx/player/step", x, y)
				create_effect(x, y + 2, spr_landeffect)
			}
			if scr_solid(x, y - 1)
			{
				reset_anim(spr_player_ceilinghit)
				state = states.bump
				event_play_oneshot_3d("event:/sfx/player/groundpound", x, y)
			}
		}
		
		if (input_buffers.grab > 0 || key_dash.pressed) && state != states.bump
		{
			input_buffers.grab = 0
			if character = p_characters.maurice
			{
				if (p_move != 0)
				  xscale = p_move
				event_play_oneshot_3d("event:/sfx/player/superjumpcancel", x, y)
				state = states.mach2
				sprite_index = spr_player_Sjumpcancel
				jumpstop = true
				vsp = -4
				movespeed = 8
				image_speed = 0.35
			}
			else
			{
				reset_anim(spr_player_Sjumpcancelstart)
				event_play_oneshot_3d("event:/sfx/player/superjumpcancel", x, y)
			}
		}
		
		aftimg_timers.blur.do_it = true
		aftimg_timers.mach.do_it = true
	}
	else
	{
		hsp = xscale * movespeed
		
		if (sprite_index == spr_player_superjumpprep || sprite_index == spr_player_superjumpflash)
			movespeed = approach(movespeed, 0, 1)
		
		if (sprite_index == spr_player_superjumpprep)
			reset_anim_on_end(spr_player_superjumpflash)
		
	
		if ((key_up.down || !grounded) && (sprite_index == spr_player_superjumpflash || sprite_index == spr_player_superjumpmove))
		{
			var absMove = abs(p_move);
			movespeed = (!place_meeting(x + xscale, y, obj_solid)) ? absMove * 2 : 0;

			if absMove
			{
				xscale = p_move
				sprite_index = spr_player_superjumpmove
			}
			else
				sprite_index = spr_player_superjumpflash
		}
	
		if (sprite_index != spr_player_superjumpprep && (!key_up.down || character == p_characters.undoised) && grounded && !scr_solid(x, y - 1))
		{
			hsp = 0
			vsp = -12
			sjumptimer = character == p_characters.undoised ? 200 : 30
			sjumpangle = 90
			sjumper = true
			fmod_studio_event_instance_set_parameter_by_name_multiplatform(superjumpsnd, "state", 1, 1)
			create_effect(x, y, spr_superjumpexplosion)
		}
	}
	if anim_ended() && sprite_index == spr_player_Sjumpcancelstart
	{
		state = states.mach3
		sprite_index = spr_player_Sjumpcancel
		jumpstop = true
		vsp = -4
		flash = 8
		movespeed = 12
		image_speed = 0.35
		with particle_create(x, y, particles.genericpoof, xscale, 1, spr_crazyruneffect)
			depth = -150
	}
}