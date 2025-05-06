function player_slipnslide()
{
	if sprite_index == spr_slipnslide
	{
		if (movespeed <= 0)
		{
			state = states.normal
			movespeed = 0
			image_index = 0
		}
		if grounded && place_meeting(x + xscale, y, obj_solid)
		{
			vsp = -5
			reset_anim(spr_slipbanana1)
		}
		do_slope_momentum()
		image_speed = 0.35
		if grounded
		{
			movespeed -= 0.1
			if (input_buffers.jump > 0 && grounded)
			{
				input_buffers.jump = 0
				vsp = -11
				jumpstop = false
				create_effect(x, y - 5, spr_highjumpcloud2)
				scr_sound_3d(sfx_jump, x, y)
			}
		}
		if (!jumpstop && !key_jump.down && vsp < 0)
		{
			jumpstop = true
			vsp /= 10
		}
	}
	/*else if (sprite_index == spr_currentplayer)
	{
		if !(place_meeting(x, (y + 1), obj_current)
		{
			vsp = -5
			sprite_index = spr_slipbanana1
			image_index = 0
		}
	}*/
	else
	{
		hsp = (xscale * movespeed)
		if grounded
			movespeed = approach(movespeed, 0, 0.5)
		if (anim_ended() && sprite_index != spr_rockethitwall)
			image_speed = 0
		else
			image_speed = 0.35
		if (sprite_index == spr_slipbanana2)
			do_slope_momentum()
		if (grounded && vsp > -1 && sprite_index != spr_slipbanana2)
		{
			if (sprite_index == spr_rockethitwall)
			{
				reset_anim(spr_slipbanana2)
				image_speed = 0.35
			}
			else
			{
				vsp = -6
				movespeed = approach(movespeed, 0, 3)
				reset_anim(spr_rockethitwall)
				particle_create(x + 43, y, particles.bang)
			}
		}
		if (sprite_index == spr_slipbanana2)
		{
			if (anim_ended() && abs(hsp) <= 2)
				state = states.normal
		}
		if place_meeting(x + xscale, y, obj_solid)
		{
			if (sprite_index == spr_slipbanana1)
				movespeed = approach(movespeed, 0, 3)
			reset_anim(spr_rockethitwall)
			particle_create(x + 30, y, particles.bang)
			xscale *= -1
		}
	}
	instakill = true
}