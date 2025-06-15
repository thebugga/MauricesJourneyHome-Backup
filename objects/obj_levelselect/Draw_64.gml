if active
{
	draw_sprite_tiled(bg_letterbox, 0, 0, 0)
	draw_set_halign(fa_center)
	draw_set_valign(fa_middle)
	draw_set_color(c_white)
	draw_set_font(global.creditsfont)

	var _levelinfo = level_array[selected_world][selected_level]

	draw_text(screen_w / 2, 50 , world_array[selected_world])
	draw_sprite_ext(spr_titlecards, _levelinfo[0], screen_w / 2, screen_h / 2, 1.5, 1.5, 0, c_white, 1)

	var c = c_white

	ini_open($"saves/saveData{global.savefile}.ini")
	if ini_section_exists(_levelinfo[2])
	{
		draw_text(480, 392, ini_read_real(_levelinfo[2], "score", 0))
		var r = ini_read_real(_levelinfo[2], "rank", 0)

		if r != 0
		{
			var rankbg_color = ds_map_create()
			ds_map_set(rankbg_color, 0, #a0b8d8)
			ds_map_set(rankbg_color, 1, #c8f8a8)
			ds_map_set(rankbg_color, 2, #98e8f8)
			ds_map_set(rankbg_color, 3, #eaad9c)
			ds_map_set(rankbg_color, 4, #f8f8a8)
			ds_map_set(rankbg_color, 5, #f8a0f8)

			draw_ellipse_color(330, 400, 430, 500, ds_map_find_value(rankbg_color, r), ds_map_find_value(rankbg_color, r), false)
			draw_ellipse_color(330, 400, 430, 500, c_black, c_black, true)
			draw_sprite(spr_ranks_gate, r, 380, 450)
		}

		for (var i = 1; i <= 5; i++)
		{
			if ini_read_real(_levelinfo[2], "gooch" + string(i), 0)
				draw_sprite_ext(spr_goochlings, i - 1, 480, 450, 1, 1, 0, c, 1)
		}

		draw_sprite_ext(spr_lap2warning, 0, 580, 450, 1, 1, 0, c_white, 1)

		draw_set_font(global.smallerfont)
		var sf = ini_read_real(_levelinfo[2], "secret_count", 0)
		draw_text_color(480, 500, concat(sf, " out of 3 Secrets"), c_white, c_white, c_white, c_white, 1)
	}
	ini_close()
		
	draw_reset_color()
}