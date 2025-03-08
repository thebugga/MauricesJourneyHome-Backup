ini_open_from_string(obj_savesystem.ini_str_options);
var _destroyed = ini_read_real("General", "tutorblockbroken", 0);
obj_savesystem.ini_str_options = ini_close();
if _destroyed
    instance_destroy()