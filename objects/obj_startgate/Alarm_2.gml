alarm[2] = irandom(25)
var number = round(rank - 2.5) - 1
if irandom(4) > number
{
	if number < 0
	{
		with instance_create(x + irandom_range(-50, 50), (y - 175) + irandom_range(-50, 50), obj_gusbrickcloud)
		{
			sprite_index = spr_rank_stink
			image_index = irandom(2)
			image_speed = 0
			vsp = (-(irandom_range(1, 3)))
		}
	}
	if number > 0
	{
		with (instance_create(x, y, obj_dashcloud))
			sprite_index = asset_get_index(concat("spr_rank_sparkle", irandom_range(1, 4)))
	}
}