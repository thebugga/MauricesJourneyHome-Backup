function player_wizard(){
	if sprite_index != spr_wizardstart && sprite_index != spr_wizardthunder
	{
		if (sprite_index == spr_wizardwalk || sprite_index == spr_wizardidle)
		{
			hsp = (p_move * movespeed)
		}
		else if (sprite_index == spr_wizardattack || sprite_index == spr_wizardjump || sprite_index == spr_wizardfall || sprite_index == spr_wizarddoublejump)
		{
			hsp = (xscale * movespeed)
			var _accel = 0.1
			if (p_move != 0)
			{
				if (p_move != xscale)
				{
					movespeed = approach(movespeed, 0, _accel)
					if (movespeed <= 0)
					{
						xscale = p_move
						movespeed = 0
					}
				}
				else
					movespeed = approach(movespeed, 6, _accel)
			}
		}
		else if grounded
			hsp = 0
		if (dir != xscale && grounded)
		{
			dir = xscale
			movespeed = 0
		}
		if (!key_jump.down && jumpstop == 0 && vsp < 0.5)
		{
			vsp /= 2
			jumpstop = 1
		}
		if (input_buffers.jump > 0)
		{
			input_buffers.jump = 0
			 if vsp > 0 && grounded && sprite_index != spr_wizardjumpstart
			{
				reset_anim(spr_wizardjumpstart)
				movespeed = p_move != 0 ? 6 : 0
			}
			else if !doublejump
			{
				doublejump = true
				reset_anim(spr_wizarddoublejump)
				vsp = -11
				movespeed = p_move != 0 ? 6 : 0
				if (p_move != 0)
					xscale = p_move
			}
		}
		if ((sprite_index == spr_wizardfall || sprite_index == spr_wizarddoublejump) && grounded && vsp > 0)
		{
			scr_sound_3d_pitched(sfx_step, x, y)
			reset_anim(spr_wizardland)
		}
		if (p_move != 0 && grounded)
			xscale = p_move
		if grounded
		{
			jumpstop = 0
			if sprite_index != spr_wizardland && sprite_index != spr_wizardjumpstart
				sprite_index = p_move != 0 ? spr_wizardwalk : spr_wizardidle
			doublejump = false
			if (p_move != 0)
			{
				if (movespeed < 6)
					movespeed += 0.5
				else if (movespeed == 6)
					movespeed = 6
			}
			else if (sprite_index != spr_wizardjumpstart)
				movespeed = 0
		}
		else
			hsp = (xscale * movespeed)
		if ((!grounded) && place_meeting((x + sign(hsp)), y, obj_solid))
			movespeed = 0
		if (p_move != 0 && hsp != 0 && grounded)
		{
			image_speed = movespeed / 10
		}
		else
			image_speed = 0.35
		if (anim_ended())
		{
			if sprite_index == spr_wizardattack || sprite_index == spr_wizardland
				reset_anim(spr_wizardidle)
			if sprite_index == spr_wizardjumpstart
			{
				vsp = -11
				reset_anim(spr_wizardjump)
			}
			if sprite_index == spr_wizarddoublejump
				reset_anim(spr_wizardfall)
		}
		if (anim_ended() && sprite_index == spr_wizardjump) || ((!grounded) && sprite_index != spr_wizardjump && sprite_index != spr_wizarddoublejump && sprite_index != spr_wizardattack && sprite_index != spr_wizardbump)
			sprite_index = spr_wizardfall
		
		if particle_timer == 1 && grounded && p_move != 0 && (floor(image_index) == 4 || floor(image_index) == 10)
		{
			particle_timer = 0
			scr_sound_3d_pitched(sfx_step, x, y)
			create_effect(x, y + 43, spr_cloudeffect)
		}
		else
			particle_timer = 1
		if key_grab.pressed && !grounded && !(sprite_index == spr_wizardbump && character == p_characters.maurice)
		{
			hsp /= 10
			vsp /= 10
			grav /= 10
			reset_anim(spr_wizardwindup)
			state = states.wizardgrapple
		}
	}
	else
	{
		hsp = 0
		if (anim_ended())
		{
			if sprite_index == spr_wizardstart
			{
				reset_anim(spr_wizardthunder)
				//GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 1, 1, 0.9)
				//scr_soundeffect(sfx_becomeknight)
			}
			if sprite_index == spr_wizardthunder
				reset_anim(spr_wizardidle)
		}
	}
}