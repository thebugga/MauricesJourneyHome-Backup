var accel = 2
with (obj_parent_player)
{
	if (room == rank_room && check_player_coop())
	{
		var tx = 340
		if (object_index == obj_player2)
			tx += 100
		var ty = 270
		var dir = point_direction(x, y, tx, ty)
		var lx = lengthdir_x(accel, dir)
		var ly = lengthdir_y(accel, dir)
		x = approach(x, tx, abs(lx))
		y = approach(y, ty, abs(ly))
	}
}
obj_camera.visible = false
if (fadealpha > 1)
{
	fadein = 1
	if (room != rank_room)
	{
		room = rank_room
		//scr_soundeffect(asset_get_index(concat("mu_rank", global.rank)))
	}
}
if (fadein == 0)
	fadealpha += 0.1
else if (fadein == 1)
	fadealpha -= 0.1
if receiptonscreen
	receiptx = approach(receiptx, 640, 10)
else
	receiptx = approach(receiptx, 960, 10)
	
if receiptonscreen
{
	bg_alpha = approach(bg_alpha, 1, 1)
	with (obj_player1)
	visible = false
}

bg_x -= 1;
bg_y -= 1;