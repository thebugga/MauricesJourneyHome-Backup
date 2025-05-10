function player_wizarddash(){
	if grounded
	{
		image_speed = movespeed / 10
		jumpstop = 0
		sprite_index = p_move == xscale ? spr_wizarddash : spr_wizardidle
		movespeed = approach(movespeed, 0, p_move == xscale ? 0.1 : 0.25)
		doublejump = false
	}
	else
		image_speed = 0.35
	if (input_buffers.jump > 0)
	{
		input_buffers.jump = 0
			if vsp > 0 && grounded && sprite_index != spr_wizardjumpstart
		{
			vsp = -11
			reset_anim(spr_wizardzoom)
		}
		else if !doublejump
		{
			doublejump = true
			reset_anim(spr_wizarddoublejump)
			vsp = -11
		}
	}
	if (!key_jump.down && jumpstop == 0 && vsp < 0.5)
	{
		vsp /= 2
		jumpstop = 1
	}
	hsp = (xscale * movespeed)
	if (anim_ended())
	{
		if sprite_index == spr_wizarddoublejump
			reset_anim(spr_wizardfall)
	}
	if (!grounded && sprite_index != spr_wizarddoublejump && sprite_index != spr_wizardfall)
		sprite_index = spr_wizardzoom
	if movespeed < abs(p_move * 6)
	{
		state = states.wizard
		reset_anim(spr_wizardidle)
	}
	
	if key_grab.pressed && !grounded
	{
		hsp /= 10
		vsp /= 10
		grav /= 10
		reset_anim(spr_wizardwindup)
		state = states.wizardgrapple
	}
	
	if place_meeting((x + sign(hsp)), y, obj_solid)
	{
		state = states.wizard
		reset_anim(spr_wizardbump)
		movespeed = -4
		vsp = -10
	}
}