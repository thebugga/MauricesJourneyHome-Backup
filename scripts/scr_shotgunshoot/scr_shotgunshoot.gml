function scr_shotgunshoot()
{
	//scr_soundeffect(sfx_killingblow)
	with (instance_create(x, y, obj_pistoleffect))
		image_xscale = other.Xscale
	sprite_index = spr_shotgunshoot
	state = states.shotgunshoot
	Movespeed = -4
	jumpAnim = 1
	image_index = 0
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
		spdh = 2
		shotgun = 1
	}
	with (instance_create((x + (Xscale * 20)), (y + 20), obj_shotgunbullet))
	{
		image_xscale = other.Xscale
		spdh = -4
		shotgun = 1
	}
	with (instance_create((x + (Xscale * 20)), (y + 20), obj_shotgunbullet))
	{
		image_xscale = other.Xscale
		spdh = -2
		shotgun = 1
	}
	exit;
}

