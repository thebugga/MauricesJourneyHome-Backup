function scr_player_shotgun()
{
	if (sprite_index == spr_shotgunpullout)
	{
		image_speed = 0.4
		hsp = 0
		vsp = 0
		Movespeed = 0
		if (floor(image_index) == (image_number - 1))
		{
			sprite_index = spr_shotgunidle
			image_index = 0
			state = states.normal
			exit;
		}
		else
			exit;
	}
	if key_jump
		input_buffer_jump = 0
	if (dir != Xscale)
	{
		dir = Xscale
		Movespeed = 2
	}
	Move = (key_left + key_right)
	hsp = (Move * Movespeed)
	if (Move != 0)
	{
		Xscale = Move
		if (Movespeed < 8)
			Movespeed += 0.5
		else if (floor(Movespeed) == 8)
			Movespeed = 6
		if (Movespeed < 3)
			image_speed = 0.35
		else if (Movespeed > 3 && Movespeed < 6)
			image_speed = 0.45
		else
			image_speed = 0.6
	}
	else
		Movespeed = 0
	if (Movespeed > 8)
		Movespeed -= 0.1
	if (!landAnim)
	{
		if (grounded && Move != 0)
			sprite_index = spr_shotgunwalk
		else if grounded
			sprite_index = spr_shotgunidle
	}
	else if (floor(image_index) == (image_number - 1))
	{
		if (Move != 0)
			sprite_index = spr_shotgunwalk
		else
			sprite_index = spr_shotgunidle
		image_index = 0
	}
	if (!grounded)
	{
		state = states.shotgunjump
		sprite_index = spr_shotgunfall
		image_index = 0
	}
	else if (input_buffer_jump < 8)
	{
		input_buffer_jump = 8
		state = states.shotgunjump
		sprite_index = spr_shotgunjump
		image_index = 0
		jumpstop = 0
		vsp = -11
	}
	if (grounded && key_down)
	{
		state = states.shotguncrouch
		sprite_index = spr_shotgungoduck
		image_index = 0
	}
	if key_attack2
	{
		state = states.shotgundash
		sprite_index = spr_shotgunsuplexdash
		image_index = 0
		Movespeed = 10
	}
	if key_slap2
	{
		//scr_soundeffect(sfx_killingblow)
		state = states.shotgunshoot
		sprite_index = spr_shotgunshoot
		image_index = 0
		with (instance_create(x, y, obj_pistoleffect))
			image_xscale = other.Xscale
		with (instance_create((x + (Xscale * 20)), (y + 20), obj_shotgunbullet))
		{
			image_xscale = other.Xscale
			shotgun = 1
		}
		with (instance_create((x + (Xscale * 20)), (y + 20), obj_shotgunbullet))
		{
			image_xscale = other.Xscale
			spdh = 4
			shotgun = 1
		}
		with (instance_create((x + (Xscale * 20)), (y + 20), obj_shotgunbullet))
		{
			image_xscale = other.Xscale
			spdh = -4
			shotgun = 1
		}
	}
	exit;
}

