function player_superjump() 
{
	image_speed = 0.35
	hsp = xscale * movespeed
	
	if sjumper
	{
		if (sprite_index == spr_player_Sjumpcancelstart)
		{
			image_speed = 0.5
			vsp = 0
			if (p_move != 0)
			  xscale = p_move
		}
		
		if (anim_ended() && sprite_index == spr_player_Sjumpcancelstart)
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
		
		movespeed = 0
		
		if (sprite_index != spr_player_Sjumpcancelstart && sjumptimer > 0)
		{
			instakill = true
			sprite_index = spr_player_superjump
			image_speed = abs(vsp) / 25
			sjumptimer--
			vsp -= 0.6
			
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
		{
			sprite_index = spr_player_rockethitwall
			if grounded
			{
				reset_anim(spr_fallfarland)
				state = states.bump
				event_play_oneshot_3d("event:/sfx/player/step", x, y)
				create_effect(x, y + 2, spr_landeffect)
			}
		}
		
		if scr_solid(x, y - 1)
		{
			reset_anim(spr_player_ceilinghit)
			state = states.bump
			event_play_oneshot_3d("event:/sfx/player/groundpound", x, y)
		}
		
		if (input_buffers.grab > 0 || key_dash.pressed) && state != states.bump
		{
			if character == p_characters.maurice
			{
				if (p_move != 0)
				  xscale = p_move
				state = states.mach2
				sprite_index = spr_player_Sjumpcancel
				jumpstop = true
				vsp = -4
				flash = 8
				movespeed = 10
				image_speed = 0.35
			}
			else
			{
				input_buffers.grab = 0
				reset_anim(spr_player_Sjumpcancelstart)
				event_play_oneshot_3d("event:/sfx/player/superjumpcancel", x, y)
				audio_stop_sound(sfx_superjumprelease)
			}
		}
		
		aftimg_timers.blur.do_it = true
		aftimg_timers.mach.do_it = true
	}
	else
	{
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
	
		if (sprite_index != spr_player_superjumpprep && !key_up.down && grounded && !scr_solid(x, y - 1))
		{
			vsp = -12
			sjumptimer = 45
			sjumper = true
			fmod_studio_event_instance_set_parameter_by_name_multiplatform(superjumpsnd, "state", 1, 1)
			create_effect(x, y, spr_superjumpexplosion)
		}
	}
}