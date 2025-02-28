function scr_player_pogo()
{
	Move = (key_left + key_right)
	if (Move == 0 && hsp != 0)
		hsp = (Xscale * Movespeed)
	else
		hsp = (Move * Movespeed)
	if (Move != 0 && (!(place_meeting_solid(x, (y + 1)))))
	{
		if (Movespeed < 6)
			Movespeed += 0.5
	}
	if (Move != Xscale or Move == 0 or place_meeting((x + Xscale), y, obj_solid))
	{
		Movespeed = 0
		pogospeed = 6
	}
	if (sign(hsp) != 0)
		Xscale = sign(hsp)
	else if (Move != 0)
		Xscale = Move
	if (Move != Xscale)
		pogospeed = 6
	if (grounded && (!key_slap2) && sprite_index != spr_playerN_pogobounce && sprite_index != spr_playerN_pogobouncemach)
	{
		//scr_soundeffect(sfx_Npogo3)
		pogospeedprev = 0
		image_index = 0
		Movespeed = 0
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
		if (Move == Xscale && Movespeed < 12)
			pogospeed += 4
		if (Move == (-Xscale) && Movespeed > 0)
			pogospeed = 6
		Movespeed = pogospeed
		pogospeedprev = 1
	}
	if (floor(image_index) == (image_number - 1) && (sprite_index == spr_playerN_pogobounce or sprite_index == spr_playerN_pogofallmach or sprite_index == spr_playerN_pogobouncemach or sprite_index == spr_playerN_pogostart))
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
	if (Movespeed > 12)
		pogocharge = 100
	if (!key_attack)
		state = states.normal
	image_speed = 0.35
	if (key_taunt2 && sprite_index != spr_playerN_pogobounce && sprite_index != spr_playerN_pogobouncemach)
	{
		//scr_soundeffect(sfx_taunt)
		taunttimer = 20
		tauntstoredMovespeed = Movespeed
		tauntstoredsprite = sprite_index
		tauntstoredstate = state
		state = states.backbreaker
		if (supercharged == 1)
		{
			image_index = 0
			sprite_index = choose(spr_supertaunt1, spr_supertaunt2, spr_supertaunt3, spr_supertaunt4)
		}
		else
		{
			taunttimer = 20
			image_index = random_range(0, 11)
			sprite_index = spr_taunt
		}
		instance_create(x, y, obj_taunteffect)
	}
	exit;
}

