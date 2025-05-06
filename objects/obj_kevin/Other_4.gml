if (ds_list_find_index(global.ds_save_room, id) != -1)
	instance_destroy();
if global.level_minutes > timer
{
	ds_list_add(global.ds_save_room, id);
	instance_destroy();
}