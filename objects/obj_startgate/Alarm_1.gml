alarm[1] = irandom_range(1, 25)
var number = (save_data.rank - 2.5) + frac(save_data.rank - 2.5)
if irandom(3) <= abs(number)
{
	if number < 0
	{
		var s = {
			sprite: spr_rank_stink,
			index: irandom(2),
			x: x + irandom_range(-50, 50),
			y: y + rankoffset + irandom_range(-50, 50),
			ysp: -irandom_range(1, 3),
			alpha: 1
		}
		array_push(stinkshinearray, s)
	}
	else if number > 0
	{
		var s = {
			sprite: choose(spr_rank_sparkle1, spr_rank_sparkle2, spr_rank_sparkle3, spr_rank_sparkle4),
			index: 0,
			x: x + irandom_range(-50, 50),
			y: y + rankoffset + irandom_range(-50, 50)
		}
		array_push(stinkshinearray, s)
	}
}