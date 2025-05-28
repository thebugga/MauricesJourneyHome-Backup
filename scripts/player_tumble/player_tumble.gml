function player_tumble() 
{
	hsp = xscale * movespeed
	
	if (!grounded && (sprite_index == spr_crouchslip || sprite_index == spr_machroll || sprite_index == spr_mach2jump || sprite_index == spr_backslide) && character != p_characters.maurice)
	{
		sprite_index = spr_player_dive
		vsp = 10
		event_play_oneshot_3d("event:/sfx/player/dive", x, y)
	}
	
	if (sprite_index == spr_ball && grounded)
	{
		if (p_move == xscale)
			movespeed = approach(movespeed, 12, 0.25)
		else if (p_move == -xscale)
			movespeed = approach(movespeed, 8, 0.25)
		else
			movespeed = approach(movespeed, 10, 0.25)
	}
	
	if (grounded && sprite_index == spr_dive)
		reset_anim(obj_player.spr_machroll)
	if (grounded && sprite_index == spr_poundcancel1)
		reset_anim(obj_player.spr_poundcancel2)
	if (grounded && sprite_index == spr_poundcancel2)
		state = states.normal
		
	if (!grounded && input_buffers.jump > 0)
	{
		input_buffers.jump = 0
		sprite_index = spr_poundcancel1
		state = states.groundpound
		vsp = -6
		if character == p_characters.maurice
		{
			freefallsmash = movespeed
			hsp = 0
			vsp = movespeed
		}
		dir = xscale
		event_play_oneshot_3d("event:/sfx/player/dive", x, y)
	}
	
	if movespeed <= 2
		state = states.normal
		
	if (sprite_index == spr_mach2jump && grounded)
		sprite_index = spr_machroll
		
	/*if (sprite_index == spr_crouchslip && !grounded)
		sprite_index = spr_jumpdive2'
	if (sprite_index == 'jumpdive2' && grounded)
		sprite_index = spr_crouchslip*/
	
	if (sprite_index == spr_machroll && movespeed > 12)
		reset_anim_on_end(spr_backslide)
	
	if (sprite_index == spr_machroll && !grounded)
		sprite_index = spr_mach2jump
		
	if (state != states.groundpound && scr_hitwall(x + xscale, y, obj_solid))
	{
		hsp = 0
		movespeed = 0
		/*if (sprite_index == spr_ball || sprite_index == 'tumblestart)
		{
			state = states.bump
			sprite_index = spr_tumbleend'
			hsp = -xscale * 2
			vsp = -3
			jumpstop = true
		}
		else
		{*/
			state = states.bump
			reset_anim(obj_player.spr_wallsplat)
			event_play_oneshot_3d("event:/sfx/player/splat", x, y)
		//}
	}
	
	if (grounded && vsp > 0)
	{
		jumpstop = false

		if !particle_contains_sprite(spr_dashcloud)
		{
			with create_effect(x, y, spr_dashcloud)
				image_xscale = other.xscale
		}
	}
		
	if (input_buffers.jump > 0 && state != states.bump && hsp != 0 && sprite_index == spr_ball)
	{
		vsp = -11
		input_buffers.jump = 0
	}
		
	if (crouchslipbuffer > 0)
		crouchslipbuffer--
		
	//if (!key_down.down && key_dash.down && grounded && state != 1000 && (sprite_index != spr_ball && sprite_index != 'tumbleend) && !canuncrouch.isTouching(solids))
	if (!key_down.down && key_dash.down && grounded && !scr_solid(x, y - 16) && crouchslipbuffer <= 0)
	{
		if (movespeed >= 12)
			state = states.mach3
		else
			state = states.mach2
		reset_anim(obj_player.spr_rollgetup)
		event_play_oneshot_3d("event:/sfx/player/rollgetup", x, y)
	}
	
	//if (!keyDown('down.pressed && !keyDown('shift.pressed && grounded && vsp > 0 && state != 'bump' && (sprite_index != spr_ball && sprite_index != 'tumbleend.pressed && sprite_index != 'breakdance' && !canuncrouch.isTouching(solids))
	if (!key_down.down && !key_dash.down && grounded && vsp > 0 && state != states.bump && !scr_solid(x, y - 16) && crouchslipbuffer <= 0)
	{
		if (movespeed > 6)
		{
			state = states.slide
			reset_anim(obj_player.spr_machslidestart)
		}
		else
			state = states.normal
	}
	
	if (sprite_index == spr_dive && vsp < 10)
		vsp = 10
		
	if (sprite_index == spr_machroll)
		image_speed = movespeed / 20
		
	if (sprite_index == spr_backslide)
	{
		image_speed = movespeed / 20
		if (anim_ended())
			image_index = 2
	}
	
	aftimg_timers.blur.do_it = true
}