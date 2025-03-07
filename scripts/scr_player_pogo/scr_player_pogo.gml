function scr_player_pogo()
{
	move = (key_left + key_right)
	if (move == 0 && hsp != 0)
		hsp = (Xscale * movespeed)
	else
		hsp = (move * movespeed)
	if (move != 0 && (!(place_meeting_solid(x, (y + 1)))))
	{
		if (movespeed < 6)
			movespeed += 0.5
	}
	if (move != Xscale or move == 0 or place_meeting((x + Xscale), y, obj_solid))
	{
		movespeed = 0
		pogospeed = 6
	}
	if (sign(hsp) != 0)
		Xscale = sign(hsp)
	else if (move != 0)
		Xscale = move
	if (move != Xscale)
		pogospeed = 6
	if (grounded && (!key_slap2) && sprite_index != spr_playerN_pogobounce && sprite_index != spr_playerN_pogobouncemach)
	{
		//scr_soundeffect(sfx_Npogo3)
		pogospeedprev = 0
		image_index = 0
		movespeed = 0
		vsp = 0
		if (pogochargeactive == 1)
			sprite_index = spr_playerN_pogobouncemach
		else
			sprite_index = spr_playerN_pogobounce
		create_particle(x, y, particle.landcloud, 0)
	}
	if (floor(image_index) == 3 && pogospeedprev == 0 && (sprite_index == spr_playerN_pogobounce or sprite_index == spr_playerN_pogobouncemach))
	{
		if key_jump2
			vsp = -12
		else if key_down
			vsp = -3
		else
			vsp = -6
		if (move == Xscale && movespeed < 12)
			pogospeed += 4
		if (move == (-Xscale) && movespeed > 0)
			pogospeed = 6
		movespeed = pogospeed
		pogospeedprev = 1
	}
	if (animation_end() && (sprite_index == spr_playerN_pogobounce or sprite_index == spr_playerN_pogofallmach or sprite_index == spr_playerN_pogobouncemach or sprite_index == spr_playerN_pogostart))
	{
		if (pogochargeactive == 1)
			sprite_index = spr_playerN_pogofallmach
		else
			sprite_index = spr_playerN_pogofall
	}
	if (pogospeed > 12 && pogochargeactive == 0)
	{
		pogochargeactive = 1
		pogocharge = 100
		flash = 1
	}
	if (movespeed > 12)
		pogocharge = 100
	if (!key_attack)
		state = states.normal
	image_speed = 0.35
	scr_dotaunt()
	exit;
}

