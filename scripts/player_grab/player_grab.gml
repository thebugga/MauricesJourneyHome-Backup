function player_grab() 
{
	hsp = xscale * movespeed
	
	if (movespeed < 10)
	{
		movespeed += 0.5
	}
	
	if (!key_jump.down && !jumpstop && vsp < 0.5)
	{
		vsp /= 20
		jumpstop = true
	}
	
	if (input_buffers.jump > 0 && !key_down.down && coyote_time)
	{
		input_buffers.jump = 0
		jumpstop = false
		vsp = -11
		state = states.mach2
		reset_anim(obj_player.spr_longjump)
		event_play_oneshot_3d("event:/sfx/player/rollgetup", x, y)
		particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
	}
	
	if (key_down.down && !key_jump.down && grounded)
	{
		movespeed = 12
		crouchslipbuffer = 25
		state = states.tumble
		sprite_index = spr_crouchslip
		event_play_oneshot_3d("event:/sfx/player/dive", x, y)
		particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
	}
	
	if (sprite_index == spr_suplexgrab && !grounded)
		reset_anim(obj_player.spr_suplexgrabjump)
	if (grounded && sprite_index == spr_suplexgrabjump && image_index >= 4 && key_dash.down)
	{
		state = states.mach2
		sprite_index = spr_mach2
	}
	
	if (scr_hitwall(x + xscale, y) && !grounded)
	{
		wallspeed = 6
		grabclimbbuffer = 10
		state = states.climbwall
	}
	else if (scr_hitwall(x + xscale, y) && grounded)
	{
		sprite_index = spr_grabbump
		event_play_oneshot_3d("event:/sfx/player/splat", x, y)
		state = states.jump
		jumpstop = true
		hsp = 0
		movespeed = 0
		vsp = -5
	}
	
	image_speed = 0.35
	switch (sprite_index)
	{
		case spr_suplexgrab:
		case spr_grabcancel:
			if anim_ended()
				state = states.normal
			break;
		case spr_suplexgrabjump:
			if anim_ended()
				image_index = 4
			if (grounded && !key_dash.down && image_index >= 4)
				state = states.normal
			break;
	}
	
	if (anim_ended() && key_dash.down && sprite_index == spr_suplexgrab)
	{
		state = states.mach2
		sprite_index = spr_mach2
	}
	
	if (p_move != 0 && p_move != xscale)
	{
		if !grounded
		{
			reset_anim(obj_player.spr_grabcancel)
			state = states.jump
		}
		else
			state = states.normal
		movespeed = 0
	}
	aftimg_timers.blur.do_it = true
}