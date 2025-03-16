function quick_ini_read_real(argument0, _section, _key, _default)
{
	//ini_open(concat("saves/", argument0))
	with (obj_savesystem)
	{
		ini_open_from_string(ini_str)
		var b = ini_read_real(_section, _key, _default)
		ini_str = ini_close()
	}
	//ini_close()
	return b;
}

function quick_ini_read_string(argument0, _section, _key, _default)
{
    //ini_open(concat("saves/", argument0))
	with (obj_savesystem)
	{
		ini_open_from_string(ini_str)
		var b = ini_read_string(_section, _key, _default)
		ini_str = ini_close()
	}
    //ini_close()
    return b;
}
