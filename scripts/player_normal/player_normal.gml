function player_normal()
{
	var default_idle = spr_idle
	var default_move = spr_move
	if global.panic.active
	{
		default_idle = spr_panic
		
		if global.panic.timer <= 0
		{
			default_idle = spr_weak
			default_move = spr_weakmove
		}
	}
	
	if (p_move != 0 && !place_meeting(x + p_move, y, obj_solid))
	{
		movespeed = approach(movespeed, 8, movespeed > 8 ? 0.1 : 0.5)
		if (floor(movespeed) == 8)
			movespeed = 6
		xscale = p_move
		if particle_timer > 0
			particle_timer--
		else
		{
			particle_timer = 12
			scr_sound_3d_pitched(sfx_step, x, y)
			create_effect(x, y + 43, spr_cloudeffect)
		}
	}
	else
		movespeed = 0
	
	hsp = movespeed * xscale
	
	var idlegestures = 
	[
		spr_idlefrown, 
		spr_idledance, 
		spr_idlehand, 
		spr_idlecareless, 
		spr_idlewhat,
		spr_idlebite
	]
	
	if p_move != 0
		idletimer = 120
	
	if (breakdance_secret.buffer < 10)
	{
		if p_move != 0
		{
			if (sprite_index != spr_landmove)
				sprite_index = default_move
		}
		else
		{
			if (idletimer <= 0 && idletimer != -4)
			{
				reset_anim(idlegestures[irandom(5)])
				idletimer = -4
			}
			
			if (anim_ended() && idletimer == -4)
			{
				reset_anim(default_idle)
				idletimer = 180
			}
			
			if (sprite_index != spr_machslideend && sprite_index != spr_land && sprite_index != spr_bodyslamland && sprite_index != spr_facehurt && idletimer > 0)
				sprite_index = default_idle
		}
	}
	
	image_speed = 0.35
	
	if key_taunt.down
	{
		if breakdance_secret.buffer < 10
			breakdance_secret.buffer++
		else
		{
			sprite_index = spr_breakdance
			breakdance_secret.spd = approach(breakdance_secret.spd, 0.6, 0.005)
			image_speed = breakdance_secret.spd
		}
		
		if breakdance_secret.spd >= 0.5
		{
			aftimg_timers.blur.do_it = true
			if (!instance_exists(obj_beatbox))
				instance_create(x, y, obj_beatbox)
		}
	}
	else
	{
		breakdance_secret.buffer = 0
		breakdance_secret.spd = 0.25
	}
	
	if (key_down.down || scr_solid(x, y - 1))
	{
		reset_anim(obj_player.spr_crouchdown)
		state = states.crouch
	}
	
	if !grounded
	{
		state = states.jump
		reset_anim(global.panic.active && global.panic.timer <= 0 ? spr_weakjump : spr_fall)
	}
	
	if (coyote_time && input_buffers.jump > 0)
	{
		input_buffers.jump = 0
		vsp = -11
		state = states.jump
		reset_anim(global.panic.active && global.panic.timer <= 0 ? spr_weakjump : spr_jump)
		jumpstop = false
		create_effect(x, y - 5, spr_highjumpcloud2)
		scr_sound_3d(sfx_jump, x, y)
	}
	
	do_grab() //intentional game design
	
	if (key_dash.down && !place_meeting(x + xscale, y, obj_solid))
	{
		state = states.mach2
		if (movespeed < 6)
			movespeed = 6
		reset_anim(obj_player.spr_mach1)
	}
	
	switch (sprite_index)
	{
		case spr_move:
		case spr_weakmove:
			image_speed = clamp(movespeed / 15, 0.35, 0.6);
			break;
		case spr_machslideend:
		case spr_land:
			reset_anim_on_end(spr_idle)
			break;
		case spr_landmove:
			image_speed = clamp(movespeed / 15, 0.35, 0.6);
			reset_anim_on_end(spr_move);
			break;
		case spr_facehurt:
			reset_anim_on_end(spr_idle)
			break;
	}
	do_taunt()
}