function player_nicklebag() 
{
	hsp = (xscale * movespeed)
	movespeed = approach(movespeed, 0, 0.1)
	
	sprite_index = slaphand == 1 ? spr_player_slap1 : spr_player_slap2
	
	if input_buffers.grab > 0 && image_index > 5
	{
		input_buffers.grab = 0
		if slaphand >= 2
		{
		    state = states.grab
			reset_anim(spr_grabcancel)
			movespeed += 2
		}
		else
		{
			movespeed += 2
			slaphand++
			image_index = 0
		}
	}
	if anim_ended()
	{
		if (p_move != 0)
			xscale = p_move
		state = states.normal
	}
	
	if (key_down.down && !key_jump.down && grounded)
	{
		movespeed = 12
		crouchslipbuffer = 25
		state = states.tumble
		sprite_index = spr_player_crouchslip
		event_play_oneshot_3d("event:/sfx/player/dive", x, y)
		particle_create(x, y, particles.genericpoof, xscale, 1, spr_jumpdust)
	}
	
	image_speed = 0.35
	instakill = true
}