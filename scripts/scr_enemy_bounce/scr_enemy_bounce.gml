function scr_enemy_bounce()
{
	if (!grounded)
		hsp = (image_xscale * movespeed)
	else
		hsp = 0
	if (sprite_index == jumpprepspr && animation_end())
	{
		if (global.bosshealth == 8)
		{
			attack = 10
			jumpheight = 14
			movespeed = 3
		}
		if (global.bosshealth == 7)
		{
			attack = 10
			jumpheight = 7
			movespeed = 5
		}
		if (global.bosshealth == 6)
		{
			attack = 10
			jumpheight = 14
			movespeed = 6
		}
		if (global.bosshealth == 5)
		{
			attack = 50
			jumpheight = 16
			movespeed = 5
		}
		if (global.bosshealth == 4)
		{
			attack = 10
			jumpheight = 20
			movespeed = 3
		}
		if (global.bosshealth == 3)
		{
			attack = 250
			jumpheight = 16
			movespeed = 3
		}
		if (global.bosshealth == 2)
		{
			attack = 200
			jumpheight = 12
			movespeed = 5
		}
		if (global.bosshealth == 1)
		{
			attack = 120
			jumpheight = 10
			movespeed = 2
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

