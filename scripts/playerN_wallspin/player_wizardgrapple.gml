function player_wizardgrapple(){
	
	if sprite_index == spr_wizardwindup
	{
		if (p_move != 0)
			xscale = p_move
		
		wizardthrowangle = clamp(wizardthrowangle + ((key_up.down - key_down.down) * 2.5), 0, 180)
		
		if key_grab.released
		{
			reset_anim(spr_wizardattack)
		
			if !instance_exists(obj_wizardball)
			{
				with (instance_create(x, y, obj_wizardball))
				{
					playerid = other.id
					image_xscale = other.xscale
					angle = (other.wizardthrowangle * other.xscale) - 90
				}
			}
		}
		if grounded
		{
			state = states.wizard
			reset_anim(spr_wizardbump)
			vsp = -10
		}
	}
	else if sprite_index == spr_wizardattack
	{
		hsp = 0
		vsp = 0
		if anim_ended()
			image_speed = 0
	}
	else if sprite_index == spr_wizardzoom
	{
		var myball = -4
		with obj_wizardball
		{
			if playerid == other.id
				myball = id
		}
		if myball != -4
		{
			if movespeed < 50
				movespeed++
			hsp = lengthdir_x(movespeed, point_direction(x, y, myball.x, myball.y))
			vsp = lengthdir_y(movespeed, point_direction(x, y, myball.x, myball.y))
			image_speed = movespeed / 10
		}
		
		if (grounded || scr_hitwall(x + xscale, y - 1)) && character == p_characters.undoised
		{
			state = states.wizard
			reset_anim(spr_wizardbump)
			movespeed = -4
			vsp = -10
		}
		if character == p_characters.maurice
		{
			if grounded
			{
				movespeed = min(abs(hsp), 16)
				state = states.wizarddash
				vsp = -5
				reset_anim(spr_wizarddash)
			}
			else if scr_hitwall(x + xscale, y - 1)
			{
				hsp = 0
				vsp = 0
				state = states.wizardcling
				wizardclingtimer = 300
			}
		}
	}
}