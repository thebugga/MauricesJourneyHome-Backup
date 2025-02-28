function scr_playerN_hookshot()
{
	Move = (key_left + key_right)
	hsp = (Movespeed * Move)
	if (Move != 0)
		Xscale = Move
	if key_jump
	{
		vsp = -6
		instance_create(x, y, obj_washingmachine)
		sprite_index = spr_jump
		stompAnim = 0
		state = states.jump
		jumpAnim = 1
		jumpstop = 0
		image_index = 0
		freefallstart = 0
	}
	if (dir != Xscale)
	{
		dir = Xscale
		Movespeed = 0
	}
	if grounded
	{
		with (obj_camera)
		{
			shake_mag = 5
			shake_mag_acc = (10 / room_speed)
		}
		vsp = -5
		with (instance_create(x, (y + 35), obj_bangeffect))
			image_xscale = obj_parent_player.image_xscale
		instance_create(x, y, obj_landcloud)
		with (obj_parent_enemy)
		{
			if (grounded && point_in_camera(x, y, view_camera[0]))
			{
				image_index = 0
				state = states.idle
				vsp = -7
				hsp = 0
			}
		}
	}
	if (floor(image_index) == (image_number - 1) && sprite_index == spr_playerN_hookshot1)
		sprite_index = spr_playerN_hookshot2
	if (Move != 0)
	{
		if (Movespeed < 8)
			Movespeed += 0.25
		else if (Movespeed == 8)
			Movespeed = 8
	}
	else
		Movespeed = 0
	image_speed = 0.35
	exit;
}

