function player_mach3() 
{
	hsp = xscale * movespeed
	mach4mode = movespeed > 16
	
	var dashpad = sprite_index == spr_player_dashpad
	
	if (mach4mode)
	{
		if (sprite_index != spr_mach4)
		{
			flash = 8
			sprite_index = spr_mach4
		}
		
		if !particle_contains_sprite(spr_crazyruneffect)
		{
			with create_effect(x, y, spr_crazyruneffect)
			{
				image_xscale = other.xscale
				depth = -150
			}
		}
		
		if (flamecloud_buffer > 0)
			flamecloud_buffer--
		else
		{
			flamecloud_buffer = 20
			create_effect(x, y, spr_flamecloud)
		}
	}
	else if (sprite_index == spr_mach4)
	{
		flash = 8
		sprite_index = spr_mach3
	}
	
	if (!particle_contains_sprite(spr_superdashcloud) && grounded)
		particle_create(x, y, particles.genericpoof, xscale, 1, spr_superdashcloud)
	
	if (input_buffers.jump > 0 && coyote_time) 
	{
		input_buffers.jump = 0
		vsp = -11
		jumpstop = false
		reset_anim(spr_player_mach3jump)
		event_play_oneshot_3d("event:/sfx/player/jump", x, y)
		particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
	}
	
	if (grounded)
	{
		if (sprite_index == spr_player_Sjumpcancel || sprite_index == spr_rockethitwall)
			sprite_index = spr_mach3
		if (!key_dash.down && !dashpad)
		{
			reset_anim(spr_player_machslidestart)
			state = states.slide
			event_play_oneshot_3d("event:/sfx/player/break", x, y)
		}
		if (p_move != 0 && p_move != xscale && !dashpad)
		{
			reset_anim(spr_player_machslideboost3)
			state = states.slide
			event_play_oneshot_3d("event:/sfx/player/machslideboost", x, y)
		}
		
		if (movespeed < 20 && p_move == xscale)
			movespeed += mach4mode ? 0.1 : 0.025
			
		if (key_up.down && !dashpad)
		{
			state = states.superjump
			reset_anim(spr_player_superjumpprep)
			sjumper = false
		}
	}
	else
	{
		if (!jumpstop && !key_jump.down && vsp < 0)
		{
			jumpstop = true
			vsp /= 10
		}
	}
	
	do_slope_momentum()
	
	if (key_down.down)
	{
		if (grounded)
		{
			state = states.tumble
			reset_anim(spr_player_machroll)
			particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
		}
		else
		{
			if character != p_characters.maurice && sprite_index != spr_rockethitwall
			{
				state = states.tumble
				sprite_index = spr_player_dive
				vsp = 10
				event_play_oneshot_3d("event:/sfx/player/dive", x, y)
			}
			else
			{
				if input_buffers.jump > 0
				{
					input_buffers.jump = 0
					sprite_index = spr_poundcancel1
					state = states.groundpound
					freefallsmash = movespeed
					hsp = 0
					vsp = movespeed
					dir = xscale
					event_play_oneshot_3d("event:/sfx/player/dive", x, y)
				}
			}
		}
	}
	
	do_grab()
	
	if ((!grounded || scr_slope(x, y + 1)) && scr_hitwall(x + xscale, y, obj_solid))
	{
		{
			wallspeed = movespeed
			if (movespeed < 1)
				wallspeed = 1
			else
				movespeed = wallspeed
			state = states.climbwall
		}
	}
	else if (grounded && scr_hitwall(x + xscale, y, obj_solid))
	{
		state = states.bump
		reset_anim(spr_player_mach3hitwall)
		vsp = -6
		hsp = xscale * -6
		shake_camera(20, 0.8)
		event_play_oneshot_3d("event:/sfx/player/groundpound", x, y)
		event_play_oneshot_3d("event:/sfx/player/bumpwall", x, y)
	}
	image_speed = 0.4
	switch (sprite_index)
	{
		case spr_mach4:
			image_speed = 0.75
			break;
		case spr_player_mach3jump:
		case spr_player_rollgetup:
		case spr_player_mach3kill:
		case spr_player_dashpad:
			reset_anim_on_end(spr_mach3)
			break;
	}
	do_taunt()
	
	aftimg_timers.mach.do_it = true
	instakill = true
	
	if !particle_contains_sprite(spr_mach3charge)
	{
		create_followingeffect(spr_mach3charge, states.mach3, xscale)
		create_followingeffect(spr_speedlines, states.mach3, xscale)
	}
}