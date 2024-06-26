if image_alpha <= 0
	exit;


				playerx += 0.1
				playerx2 += 0.1
		if arenastate < 3
		{
			draw_set_alpha(1);
			draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, false);
			draw_sprite_ext(playersprshadow, -1, playerx, 540, 1, 1, 0, c_white, 1);
			draw_sprite_ext(player2sprshadow, -1, playerx2, 540, 1, 1, 0, c_white, 1);
			draw_sprite_ext(bossspr, -1, bossx, 540, 1, 1, 0, c_black, 1);
			draw_set_alpha(whitefade);
			draw_rectangle_color(0, 0, 960, 540, c_white, c_white, c_white, c_white, false);
			draw_set_alpha(1);
		}
		else
		{
			draw_sprite_tiled(spr_versusflame, -1, 0, flamey);
			var c_player = c_white;
			var sx = irandom_range(-introshake, introshake);
			var sx2 = irandom_range(-introshake, introshake);
			var sy = irandom_range(-introshake, introshake);
			var _index = 0;
			var _xs = 1;
			var _ys = 1;
			var px = playerx + sx;
			var px2 = playerx2 + sx;
			var py = 540 + sy;
			var bx = bossx + sy;
			var by = 540 + sy;
			if px > 0
				px = 0;
			if py < 540
				py = 540;
			if bx < 960
				bx = 960;
			if by < 540
				by = 540;
			shader_set(global.Pal_Shader);
			draw_sprite_ext(playerspr, -1, px, py, 1, 1, 0, c_player, 1);
			draw_sprite_ext(player2spr, -2, px2, py, 1, 1, 0, c_player, 1);
			draw_sprite_ext(bossspr, 0, bx, by, _xs, _ys, 0, c_player, 1);
			if _index == 1
				draw_sprite_ext(bossspr, _index, bx, by, _xs, _ys, 0, c_player, glitchalpha);
			var xx = irandom_range(-1, 1) + sx;
			var yy = irandom_range(-1, 1) + sy;
			draw_sprite(vstitle, -1, xx, yy);
			draw_sprite(vstitleplayer, -1, xx, yy);
		}