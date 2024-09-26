alarm[2] = irandom_range(1, 25)
var number = (rank - 2.5) - frac(rank - 2.5)
if irandom(3) <= abs(number)
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
	else if number > 0
	{
		with (instance_create(x + irandom_range(-50, 50), (y - 175) + irandom_range(-50, 50), obj_dashcloud))
			sprite_index = choose(spr_rank_sparkle1, spr_rank_sparkle2, spr_rank_sparkle3, spr_rank_sparkle4)
	}
}