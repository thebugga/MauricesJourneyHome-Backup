ini_open($"saves/saveData{global.savefile}.ini")

if ini_section_exists(level_name)
{
	show_debug_message("save exists!")
	save_exists = true
	save_data = {
		score_num: ini_read_real(level_name, "score", 0),
		secret_count: ini_read_real(level_name, "secret_count", 0),
		rank: ini_read_real(level_name, "rank", 0)
	}
	
	var toppin_arr = [
		{t_name: "shroom", idle: spr_shroomtoppin_idle, move: spr_shroomtoppin_move, taunt: spr_shroomtoppin_taunt},
		{t_name: "cheese", idle: spr_cheesetoppin_idle, move: spr_cheesetoppin_move, taunt: spr_cheesetoppin_taunt},
		{t_name: "tomato", idle: spr_tomatotoppin_idle, move: spr_tomatotoppin_move, taunt: spr_tomatotoppin_taunt},
		{t_name: "sausage", idle: spr_sausagetoppin_idle, move: spr_sausagetoppin_move, taunt: spr_sausagetoppin_taunt},
		{t_name: "pineapple", idle: spr_pineappletoppin_idle, move: spr_pineappletoppin_move, taunt: spr_pineappletoppin_taunt}
	]
	
	for (var i = 0; i < array_length(toppin_arr); i++)
	{
		var cur_toppin = toppin_arr[i]
		
		if ini_read_real(level_name, cur_toppin.t_name, 0)
		{
			with instance_create(x, y - 46, obj_gatetoppin)
			{
				sprs = {
					idle: cur_toppin.idle,
					move: cur_toppin.move,
					taunt: cur_toppin.taunt
				}
			}
		}
	}
}

ini_close()