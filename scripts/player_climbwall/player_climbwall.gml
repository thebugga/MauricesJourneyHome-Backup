function player_climbwall() 
{
	vsp = -wallspeed
	hsp = 0
	
	wallspeed = min(wallspeed + 0.15, 20)
	
	if (wallspeed < 0)
	{
		if (mach4mode == 0)
			movespeed += 0.2
		else
			movespeed += 0.4
	}
	
	sprite_index = wallspeed > 4 ? spr_climbwall : spr_clingwall
	image_speed = 0.5
	if !scr_hitwall(x + xscale, y)
	{
		if character == p_characters.undoised
		{
			state = states.wallspin
			sprite_index = spr_player_walljumpfall
		}
		else
		{
			vsp = 0
			if (wallspeed < 6)
				wallspeed = 6
			if (wallspeed >= 6 && wallspeed < 12)
			{
				state = states.mach2
				movespeed = wallspeed
			}
			else if (wallspeed >= 12)
			{
				flash = 8
				state = states.mach3
				sprite_index = spr_mach3
				movespeed = wallspeed
			}
		}
		
		x += xscale
		
		var h = wallspeed
		
		if scr_solid(x, y + h)
		{
			for (var i = 1; i < h; i++) {
			    if !scr_solid(x, y + 1)
					y++
			}
		}
	}
	else if scr_solid(x, y - 1)
	{
		state = states.bump
		reset_anim(obj_player.spr_ceilinghit)
		event_play_oneshot_3d("event:/sfx/player/groundpound", x, y)
	}
	grabclimbbuffer = approach(grabclimbbuffer, 0, 1)
	if (!key_dash.down && grabclimbbuffer <= 0)
	{
		state = states.jump
		sprite_index = spr_fall
		movespeed = -5
		jumpstop = false
	}
	if (input_buffers.jump > 0)
	{
		input_buffers.jump = 0
		reset_anim(obj_player.spr_mach2jump)
		movespeed = 10
		state = states.bounce
		vsp = -11
		xscale *= -1
		jumpstop = false
		event_play_oneshot_3d("event:/sfx/player/jump", x, y)
	}
	
	if (particle_timer > 0)
		particle_timer--
	else
	{
		particle_timer = 8
		create_effect(x + 12 * xscale, y, spr_cloudeffect)
	}
}