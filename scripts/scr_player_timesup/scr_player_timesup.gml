function scr_player_timesup()
{
	Xscale = 1
	inv_frames = 0
	sprite_index = spr_Timesup
	alarm[7] = -1
	alarm[8] = -1
	alarm[5] = -1
	if (room == timesuproom)
	{
		obj_player1.x = 480
		obj_player1.y = 270
		obj_player2.x = -100
		obj_player2.y = -100
	}
	if (floor(image_index) == 9)
		image_speed = 0
	if obj_timesup.image_xscale >= 1
	{
		timeup_anglediff = -obj_timesup.image_angle
		timeup_angle = point_direction(obj_timesup.x, obj_timesup.y, x, y) - obj_timesup.image_angle
		timeup_dist = point_distance(obj_timesup.x, obj_timesup.y, x, y)
		state = states.gameover
		image_speed = 0.35
	}
	exit;
}

