function scr_bossplayer_roundabout()
{
	image_speed = 0.35
	hsp = Approach(hsp, 0, 0.25)
	if floor(image_index) % 2 > 0.5 && !instance_exists(obj_lungehitbox)
	{
		with instance_create(x, y, obj_lungehitbox)
		{
			offsetx = 170
			offsety = 30
			lifetime = 5
		}
	}
	if floor(image_index) == image_number - 1
		state = states.normal
}