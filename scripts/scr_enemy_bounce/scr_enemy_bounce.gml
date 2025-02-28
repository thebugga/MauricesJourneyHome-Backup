function scr_enemy_bounce()
{
	if (!grounded)
		hsp = (image_xscale * Movespeed)
	else
		hsp = 0
	if (sprite_index == jumpprepspr && floor(image_index) == (image_number - 1))
	{
		if (global.bosshealth == 8)
		{
			attack = 10
			jumpheight = 14
			Movespeed = 3
		}
		if (global.bosshealth == 7)
		{
			attack = 10
			jumpheight = 7
			Movespeed = 5
		}
		if (global.bosshealth == 6)
		{
			attack = 10
			jumpheight = 14
			Movespeed = 6
		}
		if (global.bosshealth == 5)
		{
			attack = 50
			jumpheight = 16
			Movespeed = 5
		}
		if (global.bosshealth == 4)
		{
			attack = 10
			jumpheight = 20
			Movespeed = 3
		}
		if (global.bosshealth == 3)
		{
			attack = 250
			jumpheight = 16
			Movespeed = 3
		}
		if (global.bosshealth == 2)
		{
			attack = 200
			jumpheight = 12
			Movespeed = 5
		}
		if (global.bosshealth == 1)
		{
			attack = 120
			jumpheight = 10
			Movespeed = 2
		}
		sprite_index = jumpspr
		vsp = (-jumpheight)
	}
	if (vsp > 1 && jumpspr)
		sprite_index = airspr
	if (sprite_index == airspr && grounded)
	{
		image_index = 0
		with (obj_camera)
		{
			shake_mag = 4
			shake_mag_acc = (4 / room_speed)
		}
		sprite_index = landspr
	}
	image_speed = 0.35
	scr_collision()
	exit;
}

