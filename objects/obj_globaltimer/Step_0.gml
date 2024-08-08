var s = 15 / 900; // 0.016666666666666666
if (instance_exists(obj_pause) && !obj_pause.pause)
{
	if (room != rank_room && !instance_exists(obj_endlevelfade) && room != hub_loadingscreen)
	{
		global.level_seconds += s;
		if (global.level_seconds >= 60)
		{
			global.level_seconds = frac(global.level_seconds);
			global.level_minutes++;
		}
		global.file_seconds += s;
		if (global.file_seconds >= 60)
		{
			global.file_seconds = frac(global.file_seconds);
			global.file_minutes++;
		}
	}
}
