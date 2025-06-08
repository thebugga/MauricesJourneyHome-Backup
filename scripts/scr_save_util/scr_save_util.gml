function quick_ini_write_real(inistr, section, key, value)
{
	ini_open(inistr)
	ini_write_real(section, key, value)
	ini_close()
}

function quick_ini_read_real(inistr, section, key, value)
{
	ini_open(inistr)
	var b = ini_read_real(section, key, value)
	ini_close()
	return b
}

function save_game()
{
	//ini_open($"saves/saveData{global.savefile}.ini")
	//ini_write_real("Game", "percent", get_percentage())
	//ini_close()
}

function get_percentage()
{
	var levels = ["graveyard", "wizard", "chili", "trench"];
//	var bosses = ["w1stick", "w2stick", "w3stick", "w4stick", "w5stick"];
//	var bossach = ["pepperman", "vigilante", "noise", "fakepep", "pizzaface"];
//	var bossranks = ["b_pepperman", "b_vigilante", "b_noise", "b_fakepep"];
    var _basemax = (array_length(levels)/* - 1*/) * 14
	var _extramax = (array_length(levels)/* - 1*/) * 2
	var count = 0;
	var extracount = 0;
	for (var i = 0; i < array_length(levels); i++)
	{
		var level = levels[i];
		if (ini_read_real(level, "score", 0) > 0)
			count++;
		if (ini_read_real(level, "treasure", false))
			count++;
		var tc = 0;
		for (var j = 0; j < 4; j++)
		{
			if (ini_read_real(level, concat("gooch", j + 1), false))
				count++;
		}
		if (ini_read_real(level, "gooch5", false))
			extracount++;
		var r = ini_read_real(level, "rank", 0);
		if r == 5
			extracount++;
		count += min(r, 4)
		count += ini_read_real(level, "secret_count", 0);
		//var ac = 0;
		//for (j = 0; j < 3; j++)
		//{
		//	if (ini_read_real("achievements", concat(level, j + 1), false))
		//		ac++;
		//}
		//if ac >= 3
		//	extracount++;
	}
	/*
	for (i = 0; i < array_length(bosses); i++)
	{
		var boss = bosses[i];
		if (ini_read_real(boss, "bosskey", false))
			count++;
	}
	for (i = 0; i < array_length(bossranks); i++)
	{
		boss = bossranks[i];
		r = ini_read_string("Ranks", boss, "d");
		if r == "p"
			extracount++;
		count += ds_map_find_value(_rank_map, r);
	}
	for (i = 0; i < array_length(bossach); i++)
	{
		if (ini_read_real("achievements", bossach[i], false))
			extracount++;
	}
	*/
	var per = floor((count / _basemax) * 100);
	if per > 100
		per = 100;
	var extraper = (extracount >= _extramax) ? 1 : 0;
	trace("Base count: ", count, " out of ", _basemax);
	trace("Extra count: ", extracount, " out of ", _extramax);
	trace("Percentage: ", per, " && ", extraper);
	return per + extraper;
}