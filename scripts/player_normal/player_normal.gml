function P_shared_normal()
{
	var default_idle = spr_idle
	var default_move = spr_move
	var default_jump = spr_jump
	if has_pistol
	{
		default_idle = spr_pistolidle
		default_move = spr_pistolmove
		default_jump = spr_pistoljump
		if pistolcharge > 0
			default_idle = spr_pistolshotend
	}
	if global.panic.active
	{
		default_idle = spr_panic
		
		if global.panic.timer <= 0
		{
			default_idle = spr_weakidle
			default_move = spr_weakmove
			default_jump = spr_weakjump
		}
	}
	
	if p_move != 0
	{
		xscale = p_move
		if !place_meeting(x + p_move, y, obj_solid)
		{
			movespeed = approach(movespeed, 8, movespeed > 8 ? 0.1 : 0.5)
			if (floor(movespeed) == 8)
				movespeed = 6
		}
		else
			movespeed = 0
		if particle_timer > 0
			particle_timer--
		else if sprite_index != spr_breakdance[breakdance_secret.index]
		{
			particle_timer = 12
			event_play_oneshot_3d("event:/sfx/player/step", x, y)
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
			if !has_pistol
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
			}
			
			if (sprite_index != spr_machslideend && sprite_index != spr_pistolland && sprite_index != spr_land && sprite_index != spr_bodyslamland && sprite_index != spr_facehurt && idletimer > 0)
				sprite_index = default_idle
		}
	}
	
	image_speed = 0.35
	
	if key_taunt.down
	{
		if breakdance_secret.buffer < 10
		{
			breakdance_secret.buffer++
			breakdance_secret.index = irandom(array_length(spr_breakdance) - 1)
		}
		else
		{
			sprite_index = spr_breakdance[breakdance_secret.index]
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
		reset_anim(default_jump)
	}
	
	if (coyote_time && input_buffers.jump > 0)
	{
		input_buffers.jump = 0
		if !movespeed && key_up.down
		{
			vsp = -14
			reset_anim(spr_player_groundpoundjump)
		}
		else
		{
			vsp = -11
			reset_anim(default_jump)
		}
		state = states.jump
		jumpstop = false
		create_effect(x, y - 5, spr_highjumpcloud2)
		event_play_oneshot_3d("event:/sfx/player/jump", x, y)
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
		case spr_pistolland:
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

function P_mandrek_normal()
{
	var stats = {
		walkmin: 0.1625,
		walkaccel: 0.1225,
		runaccel: 0.18,
		decel: 0.1625,
		skiddecel: 0.25,
		walkmax: 3.125,
		waterwalkmax: 2.125,
		runmax: 16.125,
		skidflip: 1.125,
		airdecel: 0.18,
		airrundecel: 0.1625,
		airwalkdecel: 0.1225,
		idlejump: -8,
		walkjump: -8,
		runjump: -14,
		idlejumpgrav: 0.25,
		walkjumpgrav: 0.3,
		runjumpgrav: 0.35,
		idlegrav: 0.875,
		walkgrav: 0.75,
		rungrav: 1.125
	}
	
	if grounded
	{
		if key_down.down
		{
			sprite_index = spr_mandrek_duck
			hsp = approach(hsp, 0, stats.decel)
			sjumptimer += 0.1
		}
		else
		{
			sjumptimer = 0
			if p_move == -xscale
			{
				sprite_index = spr_mandrek_skid
				if abs(hsp) > stats.skidflip
					hsp = approach(hsp, 0, stats.skiddecel)
				else
				{
					xscale = p_move
					hsp = stats.walkmin * xscale
				}
			}
			else if p_move == xscale
			{
				if hsp == 0
					hsp = stats.walkmin * xscale
				else
					hsp = approach(hsp, (key_grab.down ? stats.runmax : stats.walkmax) * xscale, key_grab.down ? stats.runaccel : stats.walkaccel)
				sprite_index = spr_mandrek_walk
				image_speed = abs(hsp) / 16
			}
			else
			{
				hsp = approach(hsp, 0, stats.decel)
				if abs(hsp) <= stats.walkmin
				{
					hsp = 0
					sprite_index = spr_mandrek_idle
				}
				else
				{
					sprite_index = spr_mandrek_walk
					image_speed = abs(hsp) / 16
				}
			}
		}
		if key_jump.pressed
		{
			mandrek_jumpstartspeed = abs(hsp)
			mandrek_floored = false
			if sjumptimer > 10
				vsp = -sjumptimer
			else
				vsp = abs(hsp) >= 4.625 ? stats.runjump : stats.walkjump
			sjumptimer = 0
			if sprite_index != spr_mandrek_duck && sjumptimer <= 10
				sprite_index = spr_mandrek_jump
			grav = 0
		}
		mandrek_floored = true
	}
	else
	{
		image_speed = 0
		if p_move == -xscale
				hsp = approach(hsp, (key_grab.down ? stats.runmax : stats.walkmax) * -xscale, abs(hsp) >= 3.125 ? stats.airdecel : (mandrek_jumpstartspeed >= 3.625 ? stats.airrundecel : stats.airwalkdecel))
		else if p_move == xscale
			hsp = approach(hsp, (key_grab.down ? stats.runmax : stats.walkmax) * xscale, key_grab.down ? stats.runaccel : stats.walkaccel)
		grav = (vsp < 0 && key_jump.down) ? (mandrek_jumpstartspeed >= 4.625 ? stats.runjumpgrav : (mandrek_jumpstartspeed >= 2 ? stats.walkjumpgrav : stats.idlejumpgrav)) : (mandrek_jumpstartspeed >= 4.625 ? stats.rungrav : (mandrek_jumpstartspeed >= 2 ? stats.walkgrav : stats.idlegrav))
	}
	do_taunt()
}

function player_normal()
{
	if character == p_characters.mandrek
		P_mandrek_normal()
	else
		P_shared_normal()
}