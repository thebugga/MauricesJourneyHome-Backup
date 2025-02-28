function scr_player_barrel()
{
	image_speed = (abs(Movespeed) / 4)
	if (image_speed < 0.35)
		image_speed = 0.35
	if (image_speed > 0.85)
		image_speed = 0.85
	hsp = Movespeed
	Move = (key_right + key_left)
	if key_jump
		input_buffer_jump = 0
	if (Move != 0)
	{
		if (Move == Xscale)
			Movespeed = approach(Movespeed, (Xscale * 8), 0.5)
		else
			Movespeed = approach(Movespeed, 0, 0.5)
		if (Movespeed <= 0)
			Xscale = Move
	}
	else
		Movespeed = approach(Movespeed, 0, 0.5)
	if (sprite_index == spr_player_barrelland && floor(image_index) == (image_number - 1))
		sprite_index = spr_player_barrelidle
	if grounded
	{
		if (sprite_index != spr_player_barrelland)
		{
			if (hsp != 0)
				sprite_index = spr_player_barrelMove
			else
				sprite_index = spr_player_barrelidle
		}
		if (slopeCheck(x + Xscale, y) && hsp != 0)
		{
			with (instance_place(x, (y + 1), obj_slope))
			{
				if (sign(image_xscale) == (-sign(other.Xscale)))
					other.Movespeed = approach(other.Movespeed, (other.Xscale * 12), 0.5)
			}
		}
		if (input_buffer_jump < 8 && (!key_down))
		{
			//scr_soundeffect(sfx_jump)
			input_buffer_jump = 8
			vsp = -8.5
			if (Move != Xscale && Move != 0)
			{
				if (sign(Movespeed) == 1)
					Xscale = Move
			}
			state = states.barreljump
			sprite_index = spr_player_barreljump
			image_index = 0
			jumpstop = 0
			create_particle(x, y, particle.highjumpcloud1, 0)
		}
		if key_attack
		{
			Movespeed = (Xscale * 7)
			instance_create(x, y, obj_jumpdust)
			state = states.barrelslide
			sprite_index = spr_player_barrelslipnslide
			image_index = 0
		}
	}
	else
	{
		state = states.barreljump
		sprite_index = spr_player_barrelfall
		image_index = 0
		if (vsp < 0)
			sprite_index = spr_player_barreljump
	}
	if (place_meeting((x + sign(hsp)), y, obj_solid) && (!(place_meeting((x + sign(hsp)), y, obj_slope))))
	{
		Movespeed = 0
		if (sprite_index == spr_player_barrelMove)
			sprite_index = spr_player_barrelidle
	}
	if (sprite_index == spr_player_barrelMove)
	{
		if ((!steppy) && (floor(image_index == 4) or floor(image_index) == 13))
		{
			create_particle(x, (y + 43), particle.cloudeffect, 0)
			steppy = 1
		}
		if (floor(image_index) != 4 && floor(image_index) != 13)
			steppy = 0
	}
	exit;
}

