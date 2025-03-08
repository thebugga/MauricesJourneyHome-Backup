if (room == rm_editor)
	exit;
ini_open_from_string(obj_savesystem.ini_str_options);
var _destroyed = ini_read_real("General", "tutorblockbroken", 0);
obj_savesystem.ini_str_options = ini_close();
if !_destroyed
	{
	scr_sound_multiple("event:/sfx/misc/breakblock", x, y)
	repeat (4)
	{
	    with (create_debris((x + 32), (y + 32), spr_meteordebris))
	        vsp = (-(irandom_range(5, 11)))
	}
	with (instance_create((x + 64 ), (y + 128), obj_deatheffect))
		sprite_index = spr_hamofcheese_dead
	//scr_sleep(5)
	ini_open_from_string(obj_savesystem.ini_str_options);
	ini_write_real("General", "tutorblockbroken", 1);
	obj_savesystem.ini_str_options = ini_close();
	gamesave_async_save_options();
}
instance_destroy(solid_inst)