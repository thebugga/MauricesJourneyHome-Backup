function scr_player_knightpep()
{
	alarm[5] = 2
	alarm[7] = 60
	if (sprite_index == spr_knightpep_attack)
	{
		if Movespeed > 0
			Movespeed -= 0.05
		if floor(image_index) == (image_number - 1)
			sprite_index = spr_knightpepidle
	}
	if (sprite_index == spr_knightpepland or sprite_index == spr_knightpepwalk or sprite_index == spr_knightpepidle)
	{
		Move = (key_left + key_right)
		hsp = (Move * Movespeed)
	}
	else if (sprite_index == spr_knightpep_attack or sprite_index == spr_knightpepjump or sprite_index == spr_knightpepfall or sprite_index == spr_knightpep_doublejump)
	{
		hsp = (Xscale * Movespeed)
		Move = (key_left + key_right)
		var _accel = 0.1
		if (Move != 0)
		{
			if (Move != Xscale)
			{
				Movespeed = approach(Movespeed, 0, _accel)
				if (Movespeed <= 0)
				{
					Xscale = Move
					Movespeed = 0
				}
			}
			else
				Movespeed = approach(Movespeed, 6, _accel)
		}
	}
	else if grounded
		hsp = 0
	if (grounded && vsp > 0)
		jumpstop = 0
	if (dir != Xscale && grounded)
	{
		dir = Xscale
		Movespeed = 0
	}
	if (grounded && Move != 0 && sprite_index == spr_knightpepidle)
		sprite_index = spr_knightpepwalk
	else if (grounded && Move == 0 && sprite_index == spr_knightpepwalk)
		sprite_index = spr_knightpepidle
	if ((!key_jump2) && jumpstop == 0 && vsp < 0.5 && stompAnim == 0)
	{
		vsp /= 2
		jumpstop = 1
	}
	if (grounded && vsp > 0)
		jumpstop = 0
	if (input_buffer_jump > 0 && vsp > 0 && grounded && (sprite_index == spr_knightpepidle or sprite_index == spr_knightpepland or sprite_index == spr_knightpepwalk))
	{
		input_buffer_jump = 0
		image_index = 0
		sprite_index = spr_knightpepjumpstart
		//scr_soundeffect(sfx_jump)
		vsp = -11
		if (Move == 0)
			Movespeed = 0
		if (Move != 0)
			Movespeed = 6
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepjumpstart)
		sprite_index = spr_knightpepjump
	if ((floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepjump) or ((!grounded) && sprite_index != spr_knightpepjumpstart && sprite_index != spr_knightpepjump && sprite_index != spr_knightpepthunder && sprite_index != spr_knightpep_doublejump && sprite_index != spr_knightpep_attack))
		sprite_index = spr_knightpepfall
	if Move != 0 && grounded && vsp > 0
	{
		if steppybuffer > 0
			steppybuffer--;
		else
		{
			create_particle(x, y + 43, particle.cloudeffect, 0);
			steppybuffer = 12;
			fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
		}
	}
	if ((sprite_index == spr_knightpepfall or sprite_index == spr_knightpep_doublejump) && grounded && vsp > 0)
	{
		combo = 0
		bounce = 0
		image_index = 0
		freefallstart = 0
		momemtum = 0
		create_particle(x, y, particle.landcloud, 0)
		fmod_event_one_shot_3d("event:/sfx/pep/step", x, y);
		sprite_index = spr_knightpepland
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepland)
	{
		sprite_index = spr_knightpepidle
		knightmomentum = 0
	}
	if (Move != 0 && grounded)
		Xscale = Move
	if grounded
	{
		doublejump = 0
		if (Move != 0)
		{
			if (Movespeed < 6)
				Movespeed += 0.5
			else if (Movespeed == 6)
				Movespeed = 6
		}
		else if (sprite_index != spr_knightpepjumpstart)
			Movespeed = 0
	}
	else if (knightmiddairstop == 0)
	{
		hsp = (Xscale * Movespeed)
		if ((!doublejump) && key_jump)
		{
			doublejump = 1
			input_buffer_jump = 0
			vsp = -11
			sprite_index = spr_knightpep_doublejump
			image_index = 0
			Move = (key_left + key_right)
			if (Move != 0)
				Xscale = Move
			if (Move != 0)
				Movespeed = 6
			if (Move == 0)
				Movespeed = 0
		}
	}
	if ((!grounded) && place_meeting((x + sign(hsp)), y, obj_solid))
		Movespeed = 0
	if (Move != 0 && hsp != 0 && sprite_index != spr_knightpep_doublejump)
	{
		if (Movespeed < 1)
			image_speed = 0.15
		else if (Movespeed > 1 && Movespeed < 4)
			image_speed = 0.35
		else
			image_speed = 0.6
	}
	else
		image_speed = 0.35
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepstart)
	{
		sprite_index = spr_knightpepthunder
		GamepadSetVibration((object_index == obj_player1 ? 0 : 1), 1, 1, 0.9)
		//scr_soundeffect(sfx_becomeknight)
		image_index = 0
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpepthunder)
		sprite_index = spr_knightpepidle
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_knightpep_doublejump)
		image_index = (image_number - 1)
	if ((!instance_exists(obj_cloudeffect)) && grounded && Move != 0 && (floor(image_index) == 4 or floor(image_index) == 10))
		instance_create(x, (y + 43), obj_cloudeffect)
	if (Move != 0 && (floor(image_index) == 3 or floor(image_index) == 8) && steppy == 0)
		steppy = 1
	if (Move != 0 && floor(image_index) != 3 && floor(image_index) != 8)
		steppy = 0
	if (sprite_index == spr_knightpepfall)
	{
		knightmomentum += 0.35
		trace(knightmomentum)
	}
	if (input_buffer_slap > 0) && sprite_index != spr_knightpepstart && sprite_index != spr_knightpepthunder && sprite_index != spr_knightpep_attack
	{
		input_buffer_slap = 0
		if !instance_exists(obj_wizardball)
		{
			sprite_index = spr_knightpep_attack
			image_index = 0
			if !instance_exists(obj_wizardball)
			{
				with (instance_create(x, y, obj_wizardball))
				{
					playerid = other.id
					image_xscale = other.Xscale
					if (other.key_up)
					{
						starthsp = 8
						startvsp = -10
					}
					else
					{
						starthsp = 12
						startvsp = -6
					}
					Movespeed = starthsp
					vsp = startvsp
				}
			}
		}
		else
		{
			instance_destroy(obj_wizardball)
		}
	}
	exit;
}

