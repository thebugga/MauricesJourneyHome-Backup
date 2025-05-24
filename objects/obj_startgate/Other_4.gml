ini_open($"saves/saveData{global.savefile}.ini")

if ini_section_exists(level_name)
{
	show_debug_message("save exists!")
	save_exists = true
	save_data = {
		score_num: ini_read_real(level_name, "score", 0),
		secret_count: ini_read_real(level_name, "secret_count", 0),
		rank: ini_read_real(level_name, "rank", 0),
		goochling: [ini_read_real(level_name, "gooch1", 0), ini_read_real(level_name, "gooch2", 0), ini_read_real(level_name, "gooch3", 0), ini_read_real(level_name, "gooch4", 0), ini_read_real(level_name, "gooch5", 0)]
	}
	highscore_yray = array_create(string_width(save_data.score_num), 0)
	color_array = array_create(string_width(save_data.score_num), 0)
	for (var i = 0; i < array_length(color_array); i++)
	{
		color_array[i] = irandom(3)
		highscore_yray[i][0] = 0
		highscore_yray[i][1] = -10
	}
}

ini_close()