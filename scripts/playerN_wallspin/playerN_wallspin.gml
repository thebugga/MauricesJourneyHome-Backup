function playerN_wallspin()
{
    if (grounded && !key_down.down && vsp >= 0 && sprite_index != spr_player_walljumpfall)
    {
        vsp = -7
        if (p_move != 0)
            xscale = p_move
        sprite_index = spr_player_walljumpfall
    }
	
    if (sprite_index == spr_player_breakdance || sprite_index == spr_player_poundcancel1)
    {
        hsp = approach(hsp, (p_move * (movespeed < 12 ? 12 : abs(movespeed))), p_move != 0 ? 0.25 : 1)
        if grounded && vsp > 0 && place_meeting(x + xscale, y, obj_solid) && !place_meeting(x + xscale, y, obj_destroyable)
        {
            mask_index = mask_player_small
            if !place_meeting((x + xscale), y, obj_solid)
            {
                state = states.tumble
                reset_anim(spr_machroll)
                if (hsp != 0)
                    xscale = sign(hsp)
                if (movespeed < 6)
                    movespeed = 6
            }
            mask_index = mask_player
		}
		
	    if (grounded && sprite_index == spr_player_poundcancel1)
			reset_anim(spr_player_breakdance)
    }
    else
	{
        hsp = approach(hsp, (p_move * 8), p_move != 0 ? 0.25 : 1)
		if input_buffers.grab > 0
		{
	        input_buffers.grab = 0
			state = states.mach3
			sprite_index = spr_player_Sjumpcancel
			jumpstop = true
			vsp = -4
			flash = 8
			movespeed = 12
	        if (p_move != 0)
	            xscale = p_move
			with particle_create(x, y, particles.genericpoof, xscale, 1, spr_crazyruneffect)
				depth = -150
		}
		
	    if (grounded && vsp >= 0)
	    {
			if key_dash.down
			{
		        event_play_oneshot_3d("event:/sfx/playerN/wallbounceland", x, y)
		        input_buffers.grab = 0
		        if (p_move != 0)
		            xscale = p_move
		        jumpstop = true
		        state = states.mach3
		        movespeed = 12
		        reset_anim(spr_mach3)
		        flash = 10
			}
			else
			{
		        state = states.normal
		        movespeed = abs(hsp)
			}
	    }
		
	    if key_down.pressed && sprite_index != spr_player_poundcancel1 && !grounded && character != p_characters.undoised
	    {
	        reset_anim(spr_player_poundcancel1)
	        vsp = 20
	        input_buffers.grab = 0
	        input_buffers.jump = 0
	        return
	    }
	}
	
	instakill = true
    do_taunt()
}