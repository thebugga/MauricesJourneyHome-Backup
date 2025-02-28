function scr_player_grab()
{
	grav = 0.5
	Move = (key_left + key_right)
	if grounded
	{
		if (dir != xscale)
		{
			dir = xscale
			Movespeed = 2
			facehurt = 0
		}
		jumpstop = 0
		anger = 100
		if (!(place_meeting(x, (y + 1), obj_railparent)))
		{
			if (sprite_index != spr_swingding)
				hsp = (Move * Movespeed)
			else
				hsp = (xscale * Movespeed)
		}
		else
		{
			var _railinst = instance_place(x, (y + 1), obj_railparent)
			hsp = ((Move * Movespeed) + (_railinst.Movespeed * _railinst.dir))
		}
		if (heavy == 0)
		{
			if (sprite_index != spr_swingding)
			{
				if (Move != 0)
				{
					if (Movespeed < 6)
						Movespeed += 0.5
					else if (floor(Movespeed) == 6)
						Movespeed = 6
				}
				else
					Movespeed = 0
				if (Movespeed > 6)
					Movespeed -= 0.1
			}
		}
		else
		{
			if (Move != 0)
			{
				if (Movespeed < 4)
					Movespeed += 0.25
				else if (floor(Movespeed) == 4)
					Movespeed = 4
			}
			else
				Movespeed = 0
			if (Movespeed > 4)
				Movespeed -= 0.1
		}
		if (Move != 0 && sprite_index != spr_swingding)
			xscale = Move
		if (Move != 0)
		{
			if (sprite_index != spr_swingding)
			{
				if (Movespeed < 3 && Move != 0)
					image_speed = 0.35
				else if (Movespeed > 3 && Movespeed < 6)
					image_speed = 0.45
				else
					image_speed = 0.6
			}
			else
				image_speed = 0.35
		}
	}
	if (sprite_index != spr_swingding)
	{
		if (!grounded)
		{
			if (dir != xscale && sprite_index != spr_swingding)
			{
				dir = xscale
				Movespeed = 2
				facehurt = 0
			}
			if (Move != 0 && Move != xscale && sprite_index != spr_swingding)
				Movespeed = 2
			if (momemtum == 0)
				hsp = (Move * Movespeed)
			else
				hsp = (xscale * Movespeed)
			if (Move != 0 && Move != xscale && momemtum == 1 && Movespeed != 0)
				Movespeed -= 0.05
			if (Movespeed == 0)
				momemtum = 0
			if (Move != 0 && Movespeed < 6)
				Movespeed += 0.5
			if (Movespeed > 6)
				Movespeed -= 0.5
			if ((place_meeting_solid((x + 1), y) && Move == 1) or (place_meeting_solid((x - 1), y) && Move == -1))
				Movespeed = 0
		}
		if (dir != xscale)
		{
			dir = xscale
			Movespeed = 2
			facehurt = 0
		}
		if (Move == (-xscale))
		{
			mach2 = 0
			momemtum = 0
		}
		landAnim = 1
		if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
		{
			vsp /= 20
			jumpstop = 1
		}
		if (ladderbuffer > 0)
			ladderbuffer--
		if (place_meeting_solid(x, (y - 1)) && jumpstop == 0 && jumpAnim == 1)
		{
			vsp = grav
			jumpstop = 1
		}
		if (Move != 0 && sprite_index != spr_swingding)
			xscale = Move
	}
	else
	{
		if grounded
			Movespeed = approach(Movespeed, 0, 0.25)
		if (Movespeed <= 0)
			sprite_index = spr_haulingidle
		swingdingendcooldown++
		hsp = (xscale * Movespeed)
		if (floor(image_index) == 0 && spinsndbuffer == 0)
		{
			//scr_soundeffect(sfx_spin)
			spinsndbuffer = 5
		}
		else if spinsndbuffer > 0
			spinsndbuffer--
		if (place_meeting_solid((x + xscale), y) && ((!(place_meeting((x + sign(hsp)), y, obj_slope))) or place_meeting_slope((x + sign(hsp)), y)) && (!(place_meeting((x + sign(hsp)), y, obj_destructibles))))
		{
			if (Move != 0)
				Move = xscale
			hsp = (xscale * Movespeed)
			Movespeed = hsp
			swingdingendcooldown = 0
			state = states.finishingblow
			sprite_index = spr_swingdingend
			image_index = 0
		}
		with (instance_place((x + xscale), y, obj_destructibles))
			instance_destroy()
	}
	if (Movespeed == 2 && sprite_index == spr_swingding)
		sprite_index = spr_haulingidle
	if (grounded && input_buffer_jump > 0 && (!key_down) && (!key_attack) && vsp > 0 && sprite_index != spr_swingding)
	{
		//scr_soundeffect(sfx_jump)
		sprite_index = spr_haulingjump
		instance_create(x, y, obj_highjumpcloud2)
		if (heavy == 0)
			vsp = -11
		else
			vsp = -6
		image_index = 0
	}
	if (grounded && Move != 0 && sprite_index == spr_haulingidle)
		sprite_index = spr_haulingwalk
	else if (grounded && Move == 0 && sprite_index == spr_haulingwalk)
		sprite_index = spr_haulingidle
	if (sprite_index == spr_haulingstart && floor(image_index) == (image_number - 1))
		sprite_index = spr_haulingidle
	if ((sprite_index == spr_haulingjump && floor(image_index) == (image_number - 1)) or ((!grounded) && (sprite_index == spr_haulingwalk or sprite_index == spr_haulingidle)))
		sprite_index = spr_haulingfall
	if (grounded && vsp > 0 && (sprite_index == spr_haulingfall or sprite_index == spr_haulingjump))
		sprite_index = spr_haulingland
	if (sprite_index == spr_haulingland && floor(image_index) == (image_number - 1))
		sprite_index = spr_haulingidle
	if (key_slap2 && sprite_index != spr_swingding)
	{
		if (Move != 0)
			Move = xscale
		hsp = (xscale * Movespeed)
		Movespeed = hsp
		state = states.finishingblow
		if (!key_up)
			sprite_index = choose(spr_finishingblow1, spr_finishingblow2, spr_finishingblow3, spr_finishingblow4, spr_finishingblow5)
		else if key_up
			sprite_index = spr_uppercutfinishingblow
		image_index = 0
	}
	else if (key_slap2 && sprite_index == spr_swingding && swingdingendcooldown > 20)
	{
		if (Move != 0)
			Move = xscale
		hsp = (xscale * Movespeed)
		Movespeed = hsp
		swingdingendcooldown = 0
		state = states.finishingblow
		sprite_index = spr_swingdingend
		image_index = 0
	}
	if (key_down && (!grounded))
	{
		sprite_index = spr_piledriver
		vsp = -5
		state = states.superslam
		dir = Move
		image_index = 0
		image_speed = 0.35
	}
	if ((!instance_exists(obj_cloudeffect)) && grounded && Move != 0 && (floor(image_index) == 4 or floor(image_index) == 10))
		instance_create(x, (y + 43), obj_cloudeffect)
	if (key_down && grounded && sprite_index != spr_swingding && sprite_index != spr_swingdingend)
	{
		state = states.crouch
		landAnim = 0
		crouchAnim = 1
		image_index = 0
		idle = 0
	}
	if (Move != 0 && (floor(image_index) == 3 or floor(image_index) == 8) && steppy == 0)
		steppy = 1
	if (Move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
		steppy = 0
	if (sprite_index != spr_swingding)
		image_speed = 0.35
	else
		image_speed = 0.5
	if (grabbingenemy && (!instance_exists(baddiegrabbedID)))
	{
		state = states.normal
		landAnim = 0
		image_index = 0
	}
	exit;
}

