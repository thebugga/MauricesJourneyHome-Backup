if (special_prompts == -4 && room != ObjectnMacroloadinRoom && room != characterselect)
{
	special_prompts = ds_map_create()
	ini_open(concat("saveData", global.currentsavefile, ".ini"))
	ds_map_set(special_prompts, "knight", ini_read_real("Prompts", "knight", 0))
	ds_map_set(special_prompts, "boxxedpep", ini_read_real("Prompts", "boxxedpep", 0))
	ds_map_set(special_prompts, "mort", ini_read_real("Prompts", "mort", 0))
	ds_map_set(special_prompts, "squished", ini_read_real("Prompts", "squished", 0))
	ds_map_set(special_prompts, "skateboard", ini_read_real("Prompts", "skateboard", 0))
	ds_map_set(special_prompts, "cheeseball", ini_read_real("Prompts", "cheeseball", 0))
	ds_map_set(special_prompts, "shotgun", ini_read_real("Prompts", "shotgun", 0))
	ds_map_set(special_prompts, "ghost", ini_read_real("Prompts", "ghost", 0))
	ds_map_set(special_prompts, "firemouth", ini_read_real("Prompts", "firemouth", 0))
	ds_map_set(special_prompts, "fireass", ini_read_real("Prompts", "fireass", 0))
	ds_map_set(special_prompts, "bombpep", ini_read_real("Prompts", "bombpep", 0))
	ds_map_set(special_prompts, "rocket", ini_read_real("Prompts", "rocket", 0))
	ini_close()
}
if (room == ObjectnMacroloadinRoom)
{
	if (special_prompts != -4)
		ds_map_destroy(special_prompts)
	special_prompts = -4
}
tv_bg_index = 0
switch global.leveltosave
{
    case "garbage":
        tv_bg_index = 0
        break
    case "wizard":
        tv_bg_index = 1
        break
}
if (room == rm_test)
	global.srank = 5000
else if (room == wizard_1)
	global.srank = 3000
else if (room == garbage_1)
	global.srank = 2000
global.arank = (global.srank / 2)
global.brank = (global.srank / 4)
global.crank = (global.srank / 8)
if (room == custom_lvl_room)
	alarm[1] = 4
