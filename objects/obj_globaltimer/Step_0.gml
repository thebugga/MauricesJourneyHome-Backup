var s = 15 / 900; // 0.01666...
if (instance_exists(obj_pause))
{
	if (room  != rank_room)
	{
		global.file_seconds += s;
		if global.file_seconds >= 60
		{
			global.file_seconds = 0;
			global.file_minutes++;
		}
		global.level_seconds += s;
		if global.level_seconds >= 60
		{
			global.level_seconds = 0;
			global.level_minutes++;
		}
	}
}
