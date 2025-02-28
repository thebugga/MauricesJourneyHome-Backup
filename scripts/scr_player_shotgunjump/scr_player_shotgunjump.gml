function scr_player_shotgunjump()
{
	image_speed = 0.35
	Move = (key_left + key_right)
	hsp = (Move * Movespeed)
	if (ladderbuffer > 0)
		ladderbuffer--
	if key_jump
		input_buffer_jump = 0
	if (dir != Xscale)
	{
		dir = Xscale
		Movespeed = 0
	}
	if (Move != 0)
	{
		Xscale = Move
		if (Movespeed < 8)
			Movespeed += 0.5
		else if (floor(Movespeed) == 8)
			Movespeed = 6
	}
	else
		Movespeed = 0
	if ((!key_jump2) && vsp < 0.5 && (!jumpstop))
	{
		vsp /= 20
		jumpstop = 1
	}
	if (place_meeting_solid(x, (y - 1)) && (!jumpstop))
	{
		vsp = grav
		jumpstop = 1
	}
	if (input_buffer_jump < 8 && grounded)
	{
		input_buffer_jump = 8
		state = states.shotgunjump
		vsp = -11
		jumpstop = 0
		sprite_index = spr_shotgunjump
		image_index = 0
	}
	if (grounded && vsp > 0)
	{
		sprite_index = spr_shotgunland
		image_index = 0
		landAnim = 1
		state = states.shotgun
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
		if (!key_down)
		{
			sprite_index = spr_shotgunshoot
			image_index = 0
			state = states.shotgunshoot
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
		else
		{
			state = states.shotgunfreefall
			sprite_index = spr_shotgunjump1
			image_index = 0
			vsp = -11
			with (instance_create((x + (Xscale * 30)), (y + 60), obj_shotgunbullet))
			{
				image_xscale = other.Xscale
				sprite_index = sprite10391
				spdh = -10
				spd = 0
				shotgun = 1
			}
			with (instance_create((x + (Xscale * 30)), (y + 60), obj_shotgunbullet))
			{
				image_xscale = other.Xscale
				sprite_index = sprite10391
				spdh = -10
				spd = 5
				shotgun = 1
			}
			with (instance_create((x + (Xscale * 30)), (y + 60), obj_shotgunbullet))
			{
				image_xscale = other.Xscale
				sprite_index = sprite10391
				spdh = -10
				spd = -5
				shotgun = 1
			}
		}
	}
	if (sprite_index == spr_shotgunjump && floor(image_index) == (image_number - 1))
		sprite_index = spr_shotgunfall
	exit;
}

