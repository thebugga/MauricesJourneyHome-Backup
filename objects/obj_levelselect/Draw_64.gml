draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
draw_set_font(global.bigfont)

var _levelinfo = level_array[selected_world][selected_level]
draw_text(480, 270 + 50 , concat(world_array[selected_world], "\n", selected_level + 1, ". ", _levelinfo[0]))

var c = c_white

if _levelinfo[2] != "hub"
{
	ini_open_from_string(obj_savesystem.ini_str)
	draw_text(480, 392, ini_read_real("Highscore", _levelinfo[2], 0))
	var r = ini_read_string("Ranks", string(_levelinfo[2]), 0)
	switch r
	{
		case "p":
			rank_index = 5
			break;
		case "s":
			rank_index = 4
			break;
		case "a":
			rank_index = 3
			break;
		case "b":
			rank_index = 2
			break;
		case "c":
			rank_index = 1
			break;
		case "d":
			rank_index = 0
			break;
	}

	if r != 0
	{
		var rankbg_color = ds_map_create()
		ds_map_set(rankbg_color, 0, #a0b8d8)
		ds_map_set(rankbg_color, 1, #c8f8a8)
		ds_map_set(rankbg_color, 2, #98e8f8)
		ds_map_set(rankbg_color, 3, #eaad9c)
		ds_map_set(rankbg_color, 4, #f8f8a8)
		ds_map_set(rankbg_color, 5, #f8a0f8)

		draw_ellipse_color(330, 400, 430, 500, ds_map_find_value(rankbg_color, rank_index), ds_map_find_value(rankbg_color, rank_index), false)
		draw_ellipse_color(330, 400, 430, 500, c_black, c_black, true)
		draw_sprite(spr_ranks_gate, rank_index, 380, 450)
	}

	for (var i = 0; i < 5; i++)
	{
		if ini_read_real("Goochling", concat(_levelinfo[2], i + 1), 0)
			draw_sprite_ext(spr_goochling, i, 480, 450, 1, 1, 0, c, 1)
	}

	draw_sprite_ext(spr_lap2warning, 0, 580, 450, 1, 1, 0, c_white, 1)

	draw_set_font(global.smallfont)
	var sf = ini_read_real("Secret", _levelinfo[2], 0)
		draw_text_color(480, 500, concat(sf, " OUT OF 3 SECRETS"), c_white, c_white, c_white, c_white, 1)
	ini_close()
}

draw_set_halign(fa_left)
draw_set_valign(fa_top)
draw_set_font(global.font_small)
draw_text_color(5, 490, concat("Character: ", character_array[selected_character][1]), c_white, c_white, c_white, c_white, 1)
draw_text_color(5, 510, "Press 1 to Switch", c_white, c_white, c_white, c_white, 1)
draw_text_color(5, 450, "Press Up to Switch Clothes", c_white, c_white, c_white, c_white, 1)
draw_text_color(5, 470, concat("Palette: ", string(obj_player1.paletteselect)), c_white, c_white, c_white, c_white, 1)
