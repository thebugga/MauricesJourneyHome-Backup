switch (state)
{
	case 0:
		if white_fade_alpha < 1
			white_fade_alpha += 0.1
		else
		{
			room_goto(rank_room)
			
			obj_player.spawn = "a"
			x = obj_player.x - obj_camera.campos.x
			y = obj_player.y - obj_camera.campos.y
			
			state++
			
			rank_ix = calculate_rank(rank_scorefinal)
			
			scr_sound(rank_data[rank_ix].song)
		}
		break;
	case 1:
		obj_player.sprite_index = obj_player.spr_idle
		var tx = 340
		var ty = screen_h / 2
		var dir = point_direction(x, y, tx, ty)
		var lx = lengthdir_x(2, dir)
		var ly = lengthdir_y(2, dir)
		x = approach(x, tx, abs(lx))
		y = approach(y, ty, abs(ly))
		break
}

if receiptonscreen
	receiptx = approach(receiptx, screen_w - 320, 10)
else
	receiptx = approach(receiptx, screen_w, 10)

if room != rank_room && sprite_index == rank_data[rank_ix].sprite
	instance_destroy()
