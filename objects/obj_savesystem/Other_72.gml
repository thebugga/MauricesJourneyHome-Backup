var ident = ds_map_find_value(async_load, "id");
var status = ds_map_find_value(async_load, "status");
var error = ds_map_find_value(async_load, "error");

switch state
{
	case 1:
	case 3:
		if ident == saveid
		{
			buffer_delete(savebuff);
			trace("Save status: ", status, ", error: ", error);
			state = 0;
		}
		break;
	
	case 2:
		if ident == loadid
		{
			var buffstring = buffer_read(loadbuff, 11);
			ini_open_from_string(buffstring);
			global.garbagecutscene = ini_read_real("cutscene", "garbage", false);
			global.wizardcutscene = ini_read_real("cutscene", "wizard", false);
			with obj_achievementtracker
			{
				achievements_load(achievements_update);
				achievements_load(achievements_notify);
			}
			ini_str = ini_close();
			buffer_delete(loadbuff);
			trace("inistr: ", ini_str);
			trace("buffstring: ", buffstring);
			state = 0;
		}
		break;
}
