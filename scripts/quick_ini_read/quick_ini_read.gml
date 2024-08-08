function quick_ini_read_real(argument0, _section, _key, _default)
{
	ini_open(concat("saves/", argument0))
	var b = ini_read_real(_section, _key, _default)
	ini_close()
	return b;
}

function quick_ini_read_string(argument0, _section, _key, _default)
{
    ini_open(concat("saves/", argument0))
    var b = ini_read_string(_section, _key, _default)
    ini_close()
    return b;
}
