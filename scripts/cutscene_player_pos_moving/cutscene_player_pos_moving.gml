function cutscene_player_pos_lerp(argument0, argument1, argument2)
{
	var _finish = 0
	with (obj_player)
	{
		hsp = 0
		vsp = 0
		if (object_index != obj_player2 or global.coop)
		{
			x = lerp(x, argument0, argument2)
			y = lerp(y, argument1, argument2)
			if (x > (argument0 - 4) && x < (argument0 + 4) && y > (argument1 - 4) && y < (argument1 + 4))
				_finish = 1
		}
	}
	if _finish
		cutscene_end_action()
	exit;
}

function cutscene_player_pos_approach(argument0, argument1, argument2)
{
	var _finish = 0
	with (obj_player)
	{
		hsp = 0
		vsp = 0
		if (object_index != obj_player2 or global.coop)
		{
			var dir = point_direction(x, y, argument0, argument1)
			var lx = lengthdir_x(argument2, dir)
			var ly = lengthdir_y(argument2, dir)
			x = Approach(x, argument0, abs(lx))
			y = Approach(y, argument1, abs(ly))
			if (x > (argument0 - argument2) && x < (argument0 + argument2) && y > (argument1 - argument2) && y < (argument1 + argument2))
				_finish = 1
		}
	}
	if _finish
		cutscene_end_action()
	exit;
}

